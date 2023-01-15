# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2022 Open Networking Foundation (ONF) and the ONF Contributors
# -----------------------------------------------------------------------

##-------------------##
##---]  GLOBALS  [---##
##-------------------##

# Gather sources to check
# TODO: implement deps, only check modified files
python-check-find := find . -name '*venv*' -prune\
  -o \( -name '*.py' \)\
  -type f -print0

# python-check    := $(env-clean) pylint
python-check    := pylint

# python-check-args += --dry-run

##-------------------##
##---]  TARGETS  [---##
##-------------------##
ifndef NO-LINT-PYTHON
  lint : lint-python
endif

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
lint-python:
	$(HIDE)$(env-clean) $(python-check-find) \
	    | $(xargs-n1) $(python-check) $(python-check-args)

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
help ::
	@echo '  lint-python                   Syntax check python sources'

# [EOF]
