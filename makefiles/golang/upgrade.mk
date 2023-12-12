# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2024 Open Networking Foundation (ONF) and the ONF Contributors
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
#
# SPDX-FileCopyrightText: 2024 Open Networking Foundation (ONF) and the ONF Contributors
# SPDX-License-Identifier: Apache-2.0
# -----------------------------------------------------------------------

$(if $(DEBUG),$(warning ENTER))

##-------------------##
##---]  GLOBALS  [---##
##-------------------###
# repo:voltha-protos  v1.16.3
# [VOL-5222]          v1.21.5
golang-version-upgrade ?= \
  $(error $(MAKE) $@: golang-version-upgrade= is required)

## -----------------------------------------------------------------------
## Intent: Display version of the golang interpreter.
## -----------------------------------------------------------------------
## Note:
##   - Two versions are available:
##     - The first is installed on the local system
##     - The second is installed and access through a docker image.
## -----------------------------------------------------------------------
.PHONY: golang-version golang-version-help
golang-version:

	$(call banner-enter,$@)
	${GO} version
	$(call banner-leave,$@)

help-golang += golang-version-help
golang-version-help:
	@printf '  %-33.33s %s\n' "$@" \
	  'Display golang interpreter version'

## -----------------------------------------------------------------------
## Intent: Update intrepter version to install (go.mod)
## -----------------------------------------------------------------------
.PHONY: golang-upgrade golang-upgrade-help
golang-upgrade:

    # Access early to avoid error manifestation in docker
	@assigned_for_side_effects="$(golang-version-upgrade)"

	$(call banner-enter,$@)

	${GO} mod edit -go $(golang-version-upgrade)
	${GO} version

	$(GO) mod edit -go $(golang-version-upgrade)
	$(GO) version

	$(call banner-leave,$@)

help-golang += golang-upgrade-help
golang-upgrade-help:
	@printf '  %-33.33s %s\n' "$@" \
	  'Upgrade installed version of the golang interpreter (go.mod)'

help-golang : $(help-golang)

$(if $(DEBUG),$(warning LEAVE))

# [EOF]
