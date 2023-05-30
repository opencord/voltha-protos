# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2017-2023 Open Networking Foundation (ONF) and the ONF Contributors
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
VOLTHA_TOOLS_VERSION ?= 2.4.0

docker-run     := docker
ifdef DOCKER_DEBUG
  docker-run   += --debug
endif
docker-run     += run --rm --user $$(id -u):$$(id -g)#   # Docker command stem
docker-run-app = $(docker-run) -v ${CURDIR}:/app#              # w/filesystem mount

## GhostBusters: Cross the streams
## Always pass -it to attach streams, jenkins + docker == test -t fail
is-stdin       = $(shell test -t 0 && { echo '--interactive' })#              # Attach streams if interactive
is-stdin       += --tty#                                                      # Attach stdout else jenkins::docker is silent

# Docker volume mounts: container:/app/release <=> localhost:{pwd}/release
vee-golang     = -v gocache-${VOLTHA_TOOLS_VERSION}:/go/pkg
vee-citools    = voltha/voltha-ci-tools:${VOLTHA_TOOLS_VERSION}

# Tool Containers
PROTOC    = $(docker-run) -v ${CURDIR}:/app $(is-stdin) $(vee-citools)-protoc protoc
PROTOC_SH = $(docker-run) -v ${CURDIR}:/go/src/github.com/opencord/voltha-protos/v5 $(is-stdin) --workdir=/go/src/github.com/opencord/voltha-protos/v5 $(vee-citools)-protoc sh -c
GO        = $(docker-run) -v ${CURDIR}:/app $(is-stdin) -v gocache:/.cache $(vee-golang) $(vee-citools)-golang go

docker-sh = $(PROTOC_SH)

$(if $(DEBUG),$(warning LEAVE))

# [EOF]
