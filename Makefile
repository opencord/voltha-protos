# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2019-2024 Open Networking Foundation Contributors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# -----------------------------------------------------------------------
# SPDX-FileCopyrightText: 2019-2024 Open Networking Foundation Contributors
# SPDX-License-Identifier: Apache-2.0
# -----------------------------------------------------------------------

.PHONY: test
export .DEFAULT_GOAL := test

##-------------------##
##---]  GLOBALS  [---##
##-------------------##
TOP         ?= .
MAKEDIR     ?= $(TOP)/makefiles

$(if $(VERBOSE),$(eval export VERBOSE=$(VERBOSE))) # visible to include(s)

##--------------------------
## Enable setup.py debugging
##--------------------------
# https://docs.python.org/3/distutils/setupscript.html#debugging-the-setup-script
# export DISTUTILS_DEBUG := 1      # verbose: pip
export DOCKER_DEBUG    := 1      # verbose: docker

# Makefile for voltha-protos
default: test

## Library linting
# NO-LINT-MAKEFILE := true    # cleanup needed
NO-LINT-SHELL    := true    # cleanup needed

##--------------------##
##---]  INCLUDES  [---##
##--------------------##
include $(MAKEDIR)/include.mk

# Function to extract the last path component from go_package line in .proto files
define go_package_path
$(shell grep go_package $(1) | sed -n 's/.*\/\(.*\)";/\1/p')
endef

# -----------------------------------------------------------------------
# Function to extract the last path component from package line in .proto files
#   % grep 'package' will match:
#     o package <name> ;
#     o option java_package='<dot-pkg-fqdn>
# -----------------------------------------------------------------------
# RETURN: protos/voltha_protos/common.proto => common
# -----------------------------------------------------------------------
define java_package_path
$(shell grep package $(1) | sed -n 's/.*\/\(.*\)";/\1/p')
endef

# Variables
PROTO_FILES := $(sort $(wildcard protos/voltha_protos/*.proto))

PROTO_PYTHON_DEST_DIR := python/voltha_protos
PROTO_PYTHON_PB2 := $(foreach f, $(PROTO_FILES), $(patsubst protos/voltha_protos/%.proto,$(PROTO_PYTHON_DEST_DIR)/%_pb2.py,$(f)))
PROTO_PYTHON_PB2_GRPC := $(foreach f, $(PROTO_FILES), $(patsubst protos/voltha_protos/%.proto,$(PROTO_PYTHON_DEST_DIR)/%_pb2_grpc.py,$(f)))
PROTO_GO_DEST_DIR := go
PROTO_GO_PB:= $(foreach f, $(PROTO_FILES), $(patsubst protos/voltha_protos/%.proto,$(PROTO_GO_DEST_DIR)/$(call go_package_path,$(f))/%.pb.go,$(f)))
PROTO_JAVA_DEST_DIR := java
PROTO_JAVA_PB := $(foreach f, $(PROTO_FILES), $(patsubst protos/voltha_protos/%.proto,$(PROTO_JAVA_DEST_DIR)/$(call java_package_path,$(f))/%.pb.java,$(f)))

# Force pb file to be regenrated every time.  Otherwise the make process assumes generated version is still valid
.PHONY: voltha.pb

##----------------##
##---]  DEPS  [---##
##----------------##
infra-deps := $(null)
infra-deps += Makefile
infra-deps += $(venv-activate-script)

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
print:
	@echo "Proto files: $(PROTO_FILES)"
	@echo "Python PB2 files: $(PROTO_PYTHON_PB2)"
	@echo "Go PB files: $(PROTO_GO_PB)"
	@echo "JAVA PB files: $(PROTO_JAVA_PB)"

## -----------------------------------------------------------------------
## Generic targets
## -----------------------------------------------------------------------
.PHONY: protos
protos: python-protos go-protos java-protos

.PHONY: build
build: protos python-build

.PHONY: test
test: python-test go-test java-test

clean :: python-clean java-clean go-clean

sterile :: clean

## -----------------------------------------------------------------------
## Python targets
## -----------------------------------------------------------------------
python-protos: $(infra-deps) $(PROTO_PYTHON_PB2)

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
$(PROTO_PYTHON_DEST_DIR)/%_pb2.py: \
  protos/voltha_protos/%.proto \
  Makefile \
  $(venv-activate-script)

	@echo
	@echo "** -----------------------------------------------------------------------"
	@echo "** $(MAKE): processing target [$@]"
	@echo "** -----------------------------------------------------------------------"

	$(activate) && python -m grpc_tools.protoc \
    -I protos \
    --python_out=python \
    --grpc_python_out=python \
    --descriptor_set_out=$(PROTO_PYTHON_DEST_DIR)/$(basename $(notdir $<)).desc \
    --include_imports \
    --include_source_info \
    $<

## -----------------------------------------------------------------------
## Intent:
## -----------------------------------------------------------------------
show:
	$(call banner-enter,target $@)
	@echo
	$(call banner-leave,target $@)

## -----------------------------------------------------------------------
## Intent:
## -----------------------------------------------------------------------
python-build: setup.py python-protos

	$(call banner-enter,target $@)

	$(RM) -r dist/
	$(activate) && python ./setup.py sdist

	$(call banner-leave,target $@)

## -----------------------------------------------------------------------
## Intent: Invoke tox to install a python interpreter then run tests.
## -----------------------------------------------------------------------
## See Also:
##   o https://tox.wiki/en/latest/cli_interface.html#tox-verbosity
##     every -v increases, every -q decreases verbosity level,
##     default WARNING (level:2)
##     map 0=CRITICAL|1=ERROR|2=WARNING|3=INFO|4=DEBUG|5=NOTSET
## -----------------------------------------------------------------------
python-test: tox.ini setup.py python-protos
	$(call banner-enter,target $@)

	$(activate) && python --version
	tox -vvv

	$(call banner-leave,target $@)

## -----------------------------------------------------------------------
## Intent:
## -----------------------------------------------------------------------
python-clean:
	find python -name '__pycache__' -type d -print0 \
	    | xargs -0 --no-run-if-empty $(RM) -r
	find python -name '*.pyc' -type f -print0 \
	    | xargs -0 --no-run-if-empty $(RM)
	$(RM) -r \
    .coverage \
    .tox \
    coverage.xml \
    dist \
    nose2-results.xml \
    python/__pycache__ \
    python/test/__pycache__ \
    python/voltha_protos.egg-info \
    "$(venv-abs-path)" \
    $(PROTO_PYTHON_DEST_DIR)/*.desc \
    $(PROTO_PYTHON_PB2) \
    $(PROTO_PYTHON_PB2_GRPC)

## -----------------------------------------------------------------------
## Intent: Revert go to a clean state.
##   o TODO - go/ directory should not be placed under revision control.
##   o Build should retrieve versioned sources from a central repo.
## -----------------------------------------------------------------------
go-clean:
	$(RM) -r go/*
	$(HIDE)$(MAKE) repair

## -----------------------------------------------------------------------
## Intent: Recover from a fatal failed build state:
##   o build removes go/ while regenerating prototypes.
##   o chicken-n-egg: make becomes fatal when go/ is removed and proten fails.
## -----------------------------------------------------------------------
repair:
	/usr/bin/env git checkout go

## -----------------------------------------------------------------------
## Intent: Go targets
## -----------------------------------------------------------------------
go-protos: voltha.pb

	$(call banner-enter,target $@)
	@echo "** Creating *.go.pb files"

	$(if $(LOCAL_FIX_PERMS),chmod -R o+w $(PROTO_GO_DEST_DIR))

	${PROTOC_SH} $(quote-double)\
	  set -e -o pipefail; \
	  for x in ${PROTO_FILES}; do \
	    echo \$$x; \
	    protoc --go_out=. --go_opt=module=github.com/opencord/voltha-protos/v5 --go-grpc_out=. --go-grpc_opt=module=github.com/opencord/voltha-protos/v5 -I protos -I protos/google/api \$$x; \
	  done\
	  $(quote-double)

	$(if $(LOCAL_FIX_PERMS),chmod -R o-w $(PROTO_GO_DEST_DIR))

	$(call banner-leave,target $@)

## -----------------------------------------------------------------------
## Intent:
## ----------------------------------------------------------------------
voltha.pb: show-proto-files
	$(call banner-enter,target $@)

	${PROTOC} \
	  -I protos \
	  -I protos/google/api \
	  --include_imports \
	  --include_source_info \
	  --descriptor_set_out=$@ \
	  ${PROTO_FILES}

	$(call banner-leave,target $@)

## -----------------------------------------------------------------------
## Intent:
## -----------------------------------------------------------------------
go-test:
	$(call banner-enter,target $@)

	test/test-go-proto-consistency.sh
	${GO} mod verify

	$(call banner-leave,target $@)

## -----------------------------------------------------------------------
## Intent: Java targets
## -----------------------------------------------------------------------

java-protos-dirs += java_temp/src/main/java
java-protos-dirs += java_temp/src/main/java/org
# local docker problem
java-protos-dirs += java_temp/src/main/java/org/opencord/voltha/adapter
java-protos-dirs += java_temp/src/main/java/org/opencord/voltha/adapter_service

mkdir-args += -vp

java-protos: voltha.pb

	$(call banner-enter,target $@)

	mkdir $(mkdir-args) $(java-protos-dirs)

	$(docker-sh) $(quote-double) find $(java-protos-dirs) -print0 \
	    | xargs -0 -n1 /bin/ls -ld $(quote-double)

	$(if $(LOCAL_FIX_PERMS),chmod -R o+w java_temp)
	@${PROTOC_SH} $(quote-double) \
	  set -e -o pipefail; \
	  for x in ${PROTO_FILES}; do \
	    echo \$$x; \
	    protoc --java_out=java_temp/src/main/java -I protos \$$x; \
	  done\
	  $(quote-double)
	$(if $(LOCAL_FIX_PERMS),chmod -R o-w java_temp)

        # Move files into place after all prototypes have generated.
        # TODO: Remove the extra step, use makefile deps and
        #       generate in-place as needed.
	@mkdir -p java
	rsync -r --checksum java_temp/src/main/java/. java/.

	$(call banner-leave,target $@)

## -----------------------------------------------------------------------
## Intent: Tests if the generated java classes are compilable
## -----------------------------------------------------------------------
java-test: java-protos
	cp test/pom.xml java_temp
	cd java_temp && mvn compile

## -----------------------------------------------------------------------
## Intent: Custodial service
## -----------------------------------------------------------------------
java-clean:
	$(RM) -r java
	$(RM) -r java_temp

## -----------------------------------------------------------------------
## Intent: Placeholder for library targets
## -----------------------------------------------------------------------
lint:
	golangci-lint run -v ./...
## -----------------------------------------------------------------------
## Intent: Make sterile is unrecoverable due to handling of java_temp
## -----------------------------------------------------------------------
protos-clean:
	$(MAKE) sterile
	$(MAKE) build
	$(MAKE) protos
	$(MAKE) test

## -----------------------------------------------------------------------
## Intent: Display/debug targets
## -----------------------------------------------------------------------
.PHONY: show-proto-files
show-proto-files:

	$(call banner-enter,Target $@)
	@echo -e "PROTO_FILES:\n$(PROTO_FILES)" | tr ' ' '\n'
	$(call banner-leave,Target $@)

# [EOF]
