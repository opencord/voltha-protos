# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2017-2023 Open Networking Foundation
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

$(if $(DEBUG),$(warning ENTER))

##-------------------##
##---]  GLOBALS  [---##
##-------------------##
.PHONY: lint-golang lint-golang-sca-all lint-golang-sca-modified

GOLANG_FILES ?= $(error GOLANG_FILES= is required)

$(info loading)
## -----------------------------------------------------------------------
## Intent: Use the golang command to perform syntax checking.
##   o If UNSTABLE=1 syntax check all sources
##   o else only check sources modified by the developer.
## Usage:
##   % make lint UNSTABLE=1
##   % make lint-golang-all
## -----------------------------------------------------------------------
ifndef NO-LINT-GOLANG
  lint-golang-mode := $(if $(have-golang-files),modified,all)
  lint : lint-golang-sca-$(lint-golang-mode)

  lint-golang-all      : lint-golang-sca-all
  lint-golang-modified : lint-golang-sca-modified
endif# NO-LINT-GOLANG

## -----------------------------------------------------------------------
## Intent: exhaustive golint syntax checking
## -----------------------------------------------------------------------
## Intent: Run goformat on files on sandbox files.
##   1) find . -name '*.go' -print0
##      - gather all *.go sources (-name '*.go')
##      - pass as a list of null terminated items (-print0)
##   2) xargs --null --max-args=[n] --no-run-if-empty gofmt -d
##      - Iterate over the list (xargs --null)
##      - process one item per line (--max-args=1)
##      - display filename-to-check (--verbose)
##      - display content when diffs are detected:
##           gofmt -d
##           gofmt -d -s
## -----------------------------------------------------------------------
lint-golang-sca-xargs := $(null)
lint-golang-sca-xargs += --null#+           # Source paths are null terminated
lint-golang-sca-xargs += --max-args=1#+     # Check one file at a time
lint-golang-sca-xargs += --no-run-if-empty
lint-golang-sca-xargs += --verbose#+        # Display source path to check

## [INPLACE-EDITS] make lint-golang-sca FIX=1
ifdef FIX
  lint-golang-sca-args += -w
endif

gofmt-args += -d# Do not output reformatted lines
# gofmt-args += -e# Display all errors (including spurious)
gofmt-args += -s# Try to simplify code

## -----------------------------------------------------------------------
## Intent: exhaustive golang syntax checking
## -----------------------------------------------------------------------
lint-golang-sca-all: $(venv-activate-script)
#       $(MAKE) --no-print-directory lint-sca-install

	find . -name '*.go' -print0 \
	    | xargs $(lint-golang-sca-xargs) gofmt $(gofmt-args)

## -----------------------------------------------------------------------
## Intent: check deps for format and cleanliness
## -----------------------------------------------------------------------
lint-golang-sca-modified: lint-golang-all
#	$(MAKE) --no-print-directory lint-golang-sca-install

	gofmt $(gofmt-args) $(GOLANG_FILES)

## -----------------------------------------------------------------------
## Intent: Tool installation as needed
## -----------------------------------------------------------------------
.PHONY: lint-golang-sca-install
lint-golang-sca-install:
	@echo
	@echo "** -----------------------------------------------------------------------"
	@echo "** golang syntax checking"
	@echo "** -----------------------------------------------------------------------"
	@echo

## -----------------------------------------------------------------------
## Intent: Display target help
## -----------------------------------------------------------------------
.PHONY: help-golang-sca
help-verbose += help-golang-sca
help-golang-sca :
	@echo "  % $(MAKE) lint-golang GOLANG_FILES=..."
	@echo '  lint-golang-sca-modified  golang checking: only modified'
	@echo '  lint-golang-sca-all       golang checking: exhaustive'

$(if $(DEBUG),$(warning LEAVE))

# [EOF]
