# -*- makefile -*-
# -----------------------------------------------------------------------
# Copyright 2022-2023 Open Networking Foundation (ONF) and the ONF Contributors (ONF) and the ONF Contributors
# -----------------------------------------------------------------------

##-------------------##
##---]  GLOBALS  [---##
##-------------------##
xargs-n1-local := $(subst -t,$(null),$(xargs-n1))#   inhibit cmd display

# Gather sources to check
# TODO: implement deps, only check modified files
make-check-find := find . \( -name makefile -o -name '*.mk' \) -type f -print0

make-check    := $(env-clean) $(MAKE)
make-check-args += --dry-run
make-check-args += --keep-going
make-check-args += --warn-undefined-variables
make-check-args += --no-print-directory

# Quiet internal undef vars
make-check-args += DEBUG=

##-------------------##
##---]  TARGETS  [---##
##-------------------##
ifndef NO-LINT-MAKEFILE
  lint : lint-make
endif

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
lint-make:
	$(HIDE)$(env-clean) $(make-check-find) \
	    | $(xargs-n1-local) $(make-check) $(make-check-args)

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
help ::
	@echo '  lint-make                     Syntax check [Mm]akefile and *.mk'

# [EOF]
