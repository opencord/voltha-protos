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
# limitations under the License.
# -----------------------------------------------------------------------

help::
	@echo
	@echo "[LINT]"

ONF_MAKE := $(MAKEDIR)

include $(ONF_MAKE)/lint/golang/include.mk
include $(ONF_MAKE)/lint/json.mk
include $(ONF_MAKE)/lint/makefile.mk
include $(ONF_MAKE)/lint/python.mk
include $(ONF_MAKE)/lint/robot.mk
include $(ONF_MAKE)/lint/shell.mk

ifndef NO-LINT-YAML
  ifdef YAML_FILES
    include $(ONF_MAKE)/lint/yaml/python.mk
  else
    include $(ONF_MAKE)/lint/yaml/yamllint.mk
  endif
endif

# [EOF]
