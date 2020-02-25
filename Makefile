# Copyright 2019-present Open Networking Foundation
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

# Makefile for voltha-protos
default: test

# set default shell options
SHELL = bash -e -o pipefail

# tool containers
VOLTHA_TOOLS_VERSION ?= 2.0.0

PROTOC    = docker run --rm --user $$(id -u):$$(id -g) -v ${CURDIR}:/app $(shell test -t 0 && echo "-it") voltha/voltha-ci-tools:${VOLTHA_TOOLS_VERSION}-protoc protoc
PROTOC_SH = docker run --rm --user $$(id -u):$$(id -g) -v ${CURDIR}:/go/src/github.com/opencord/voltha-protos/v3 $(shell test -t 0 && echo "-it") --workdir=/go/src/github.com/opencord/voltha-protos/v3 voltha/voltha-ci-tools:${VOLTHA_TOOLS_VERSION}-protoc sh -c
GO        = docker run --rm --user $$(id -u):$$(id -g) -v ${CURDIR}:/app $(shell test -t 0 && echo "-it") -v gocache:/.cache -v gocache-${VOLTHA_TOOLS_VERSION}:/go/pkg voltha/voltha-ci-tools:${VOLTHA_TOOLS_VERSION}-golang go

# Function to extract the last path component from go_package line in .proto files
define go_package_path
$(shell grep go_package $(1) | sed -n 's/.*\/\(.*\)";/\1/p')
endef

# Function to extract the last path component from package line in .proto files
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

print:
	@echo "Proto files: $(PROTO_FILES)"
	@echo "Python PB2 files: $(PROTO_PYTHON_PB2)"
	@echo "Go PB files: $(PROTO_GO_PB)"
	@echo "JAVA PB files: $(PROTO_JAVA_PB)"

# Generic targets
protos: python-protos go-protos java-protos

build: protos python-build go-protos java-protos

test: python-test go-test java-test

clean: python-clean java-clean

# Python targets
python-protos: $(PROTO_PYTHON_PB2)

venv_protos:
	virtualenv -p python3 $@;\
	source ./$@/bin/activate ; set -u ;\
	pip install grpcio-tools googleapis-common-protos

$(PROTO_PYTHON_DEST_DIR)/%_pb2.py: protos/voltha_protos/%.proto Makefile venv_protos
	source ./venv_protos/bin/activate ; set -u ;\
	python -m grpc_tools.protoc \
    -I protos \
    --python_out=python \
    --grpc_python_out=python \
    --descriptor_set_out=$(PROTO_PYTHON_DEST_DIR)/$(basename $(notdir $<)).desc \
    --include_imports \
    --include_source_info \
    $<

python-build: setup.py python-protos
	rm -rf dist/
	python ./setup.py sdist

python-test: tox.ini setup.py python-protos
	tox

python-clean:
	find python/ -name '*.pyc' | xargs rm -f
	rm -rf \
    .coverage \
    .tox \
    coverage.xml \
    dist \
    nose2-results.xml \
    python/__pycache__ \
    python/test/__pycache__ \
    python/voltha_protos.egg-info \
    venv_protos \
    $(PROTO_PYTHON_DEST_DIR)/*.desc \
    $(PROTO_PYTHON_PB2) \
    $(PROTO_PYTHON_PB2_GRPC)

# Go targets
go-protos: voltha.pb
	@echo "Creating *.go.pb files"
	@${PROTOC_SH} " \
	  set -e -o pipefail; \
	  for x in ${PROTO_FILES}; do \
	    echo \$$x; \
	    protoc --go_out=plugins=grpc:/go/src -I protos \$$x; \
	  done"

voltha.pb:
	@echo "Creating $@"
	@${PROTOC} -I protos -I protos/google/api \
	  --include_imports --include_source_info \
	  --descriptor_set_out=$@ \
	  ${PROTO_FILES}

go-test:
	test/test-go-proto-consistency.sh
	${GO} mod verify

# Java targets
java-protos: voltha.pb
	@echo "Creating java files"
	@mkdir -p java_temp/src/main/java
	@${PROTOC_SH} " \
	  set -e -o pipefail; \
	  for x in ${PROTO_FILES}; do \
	    echo \$$x; \
	    protoc --java_out=java_temp/src/main/java -I protos \$$x; \
	  done"
	#TODO: generate directly to the final location
	@mkdir -p java
	cp -r java_temp/src/main/java/* java/

# Tests if the generated java classes are compilable
java-test: java-protos
	cp test/pom.xml java_temp
	cd java_temp && mvn compile

java-clean:
	rm -rf java
	rm -rf java_temp
