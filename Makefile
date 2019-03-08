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

# Variables
PROTO_FILES := $(wildcard protos/voltha_protos/*.proto)
PROTO_PYTHON_DEST_DIR := python/voltha_protos
PROTO_PYTHON_PB2 := $(foreach f, $(PROTO_FILES), $(patsubst protos/voltha_protos/%.proto,$(PROTO_PYTHON_DEST_DIR)/%_pb2.py,$(f)))
PROTO_PYTHON_PB2_GRPC := $(foreach f, $(PROTO_FILES), $(patsubst protos/voltha_protos/%.proto,$(PROTO_PYTHON_DEST_DIR)/%_pb2_grpc.py,$(f)))

print:
	echo "Proto files: $(PROTO_FILES)"
	echo "Python PB2 files: $(PROTO_PYTHON_PB2)"
	
# set default shell
SHELL = bash -e -o pipefail

# Generic targets
protos: python-protos go-protos

build: protos python-build go-protos

test: python-test go-test

clean: python-clean go-clean

# Python targets
python-protos: $(PROTO_PYTHON_PB2)

venv_protos:
	virtualenv $@;\
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

python-build: setup.py
	python ./setup.py sdist

python-test: tox.ini setup.py python-protos
	tox

python-clean:
	rm -rf venv_protos .coverage coverage.xml nose2-results.xml dist $(PROTO_PYTHON_PB2) $(PROTO_PYTHON_PB2_GRPC) $(PROTO_PYTHON_DEST_DIR)/*.desc
	find python/ -name '*.pyc' | xargs rm -f
	rm -rf python/voltha_protos.egg-info
	rm -rf .tox
	rm -rf python/__pycache__/
	rm -rf python/test/__pycache__/

# Go targets
go-protos:
	./build_go_protos.sh protos

go-test:
	echo "FIXME: Add golang tests"

go-clean:
	echo "FIXME: Add golang cleanup"

