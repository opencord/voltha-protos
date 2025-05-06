# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2017-2024 Open Networking Foundation (ONF) and the ONF Contributors
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
# limitations under the License.d
# -----------------------------------------------------------------------

$(if $(DEBUG),$(warning ENTER))

# tool containers
VOLTHA_TOOLS_VERSION ?= 3.1.1

docker-run     := docker
ifdef DOCKER_DEBUG
  docker-run   += --debug
endif
docker-run     += run --rm --user $$(id -u):$$(id -g)#   # Docker command stem
docker-run-app = $(docker-run) -v ${CURDIR}:/app#        # w/filesystem mount

# -----------------------------------------------------------------------
# --interactive: Attach streams when stdout (fh==0) defined
# --tty        : Always create a pseudo-tty else jenkins:docker is silent
# -----------------------------------------------------------------------
is-stdin       = $(shell test -t 0 && { echo '--interactive'; })
is-stdin       += --tty

# Docker volume mounts: container:/app/release <=> localhost:{pwd}/release
vee-golang     = -v gocache-${VOLTHA_TOOLS_VERSION}:/go/pkg
vee-citools    = voltha/voltha-ci-tools:${VOLTHA_TOOLS_VERSION}

# Tool Containers
PROTOC    = $(docker-run) -v ${CURDIR}:/app $(is-stdin) $(vee-citools)-protoc protoc

PROTOC_SH := $(docker-run)
PROTOC_SH += -v ${CURDIR}:/go/src/github.com/opencord/voltha-protos/v5
PROTOC_SH += $(is-stdin) --workdir=/go/src/github.com/opencord/voltha-protos/v5
PROTOC_SH += $(vee-citools)-protoc sh -c

GO        = $(docker-run) -v ${CURDIR}:/app $(is-stdin) -v gocache:/.cache $(vee-golang) $(vee-citools)-golang go

docker-sh = $(PROTOC_SH)

$(if $(DEBUG),$(warning LEAVE))

# [EOF]
