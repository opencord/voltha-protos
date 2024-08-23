# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2023-2024 Open Networking Foundation Contributors
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
# SPDX-FileCopyrightText: 2023-2024 Open Networking Foundation Contributors
# SPDX-License-Identifier: Apache-2.0
# -----------------------------------------------------------------------

$(if $(DEBUG),$(warning ENTER))

## -----------------------------------------------------------------------
## Infer path to cloned sandbox root
## [TODO] Deprecate TOP=
## -----------------------------------------------------------------------
lf-sbx-root   := $(abspath $(lastword $(MAKEFILE_LIST)))
lf-sbx-root   := $(subst /lf/include.mk,$(null),$(lf-sbx-root))

## -----------------------------------------------------------------------
## Define vars based on relative import (normalize symlinks)
## Usage: include makefiles/onf/include.mk
## -----------------------------------------------------------------------
onf-mk-abs    := $(abspath $(lastword $(MAKEFILE_LIST)))
onf-mk-top    := $(subst /include.mk,$(null),$(onf-mk-abs))
onf-mk-lib    := $(onf-mk-top)/onf-make/makefiles
onf-mk-loc    := $(onf-mk-top)/local

## -----------------------------------------------------------------------
## Load per-repository conditionals, enable/disable lint targets
## Load late else alter MAKEFILE_LIST
## NOTE: config.mk can be removed if dynamic feature detection by file
##       extension is added.  See detect.mk
## -----------------------------------------------------------------------
include $(wildcard $(lf-sbx-root)/config.mk $(lf-sbx-root)/lf/config.mk)

## -----------------------------------------------------------------------
## This variable is a bridge to help transition away from legacy makefiles.
## -----------------------------------------------------------------------
legacy-mk     := $(lf-sbx-root)/makefiles

## -----------------------------------------------------------------------
## Legacy variables
## -----------------------------------------------------------------------
TOP           ?= $(lf-sbx-root)
ONF_MAKEDIR   ?= $(onf-mk-lib)
MAKEDIR       ?= $(onf-mk-loc)

## -----------------------------------------------------------------------
## Command macros
## -----------------------------------------------------------------------
GIT         ?= /usr/bin/env git

## -----------------------------------------------------------------------
## Usage: make DEBUG=1
## -----------------------------------------------------------------------
$(if $(DEBUG),\
  $(info **-----------------------------------------------------------------------) \
  $(warning **) \
  $(info ** TOP              : $(TOP))\
  $(info ** ONF_MAKE         : $(ONF_MAKE))\
  $(info ** MAKEDIR          : $(MAKEDIR))\
  $(info ** legacy-mk        : $(legacy-mk))\
  $(info **-----------------------------------------------------------------------) \
)
ifdef DEBUG

$(if $(DEBUG),$(warning LEAVE))

# [EOF]
