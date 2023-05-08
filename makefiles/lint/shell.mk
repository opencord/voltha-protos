# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2022 Open Networking Foundation (ONF) and the ONF Contributors
# -----------------------------------------------------------------------

##-------------------##
##---]  GLOBALS  [---##
##-------------------##

# Gather sources to check
# TODO: implement deps, only check modified files
shell-check-find := find . -name '*.sh' -type f -print0

# shell-check    := $(env-clean) pylint
shell-check      := shellcheck

shell-check-args += -a

##-------------------##
##---]  TARGETS  [---##
##-------------------##
ifndef NO-LINT-SHELL
  lint : lint-shell
endif

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
lint-shell:
	$(shell-check) -V
	@echo
	$(HIDE)$(env-clean) $(shell-check-find) \
	    | $(xargs-n1) $(shell-check) $(shell-check-args)

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
help ::
	@echo '  lint-shell                   Syntax check shell sources'

# [EOF]
