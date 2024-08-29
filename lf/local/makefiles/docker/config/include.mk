# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2024 Open Networking Foundation Contributors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# -----------------------------------------------------------------------
# SPDX-FileCopyrightText: 2023-2024 Open Networking Foundation Contributors
# SPDX-License-Identifier: Apache-2.0
# -----------------------------------------------------------------------
# Intent:
# -----------------------------------------------------------------------

$(if $(DEBUG),$(warning ENTER))

## per-repository config for docker use: makefiles/docker/include.mk
go-cobertura-docker-mount := /app/src/github.com/opencord/voltha-lib-go/v7#   #
protoc-sh-docker-mount    := /go/src/github.com/opencord/voltha-protos/v5#    #
# voltha-protos-v5          := /go/src/github.com/opencord/voltha-protos/v5

$(if $(DEBUG),$(warning LEAVE))

# [EOF]

