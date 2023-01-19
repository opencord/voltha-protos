# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2022-2023 Open Networking Foundation (ONF) and the ONF Contributors (ONF) and the ONF Contributors
# -----------------------------------------------------------------------

##-------------------##
##---]  GLOBALS  [---##
##-------------------##
env-clean = /usr/bin/env --ignore-environment
xargs-n1      := xargs -0 -t -n1 --no-run-if-empty

yamllint      := $(env-clean) $(YAMLLINT)
yamllint-args := -c .yamllint

##-------------------##
##---]  TARGETS  [---##
##-------------------##
lint : lint-yaml

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
lint-yaml:
	$(HIDE)$(env-clean) find . -name '*.yaml' -type f -print0 \
	    | $(xargs-n1) $(yamllint) $(yamllint-args)

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
help:
	@echo
	@echo "USAGE: $(MAKE)"
	@echo "  lint        perform syntax checks on source"
	@echo "  test        perform syntax checks on source"
	@echo "  pre-check   Verify tools and deps are available for testing"
	@echo
	@echo "[LINT]"
	@echo "  lint-json   Syntax check .json sources"
	@echo "  lint-yaml   Syntax check .yaml sources"
	@echo
# [EOF]
