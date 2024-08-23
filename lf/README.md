# repo:onf-make - Library makefiles

> $(sandbox-root)/include.mk
>>    Source this makefile to import all makefile logic.
>
> $(sandbox-root)/lf/onf-make/
> $(sandbox-root)/lf/onf-make/include.mk
>>    repo:onf-make contains common library makefile logic.
>>    tag based checkout (frozen) as a git submodule.
> 
> $(sandbox-root)/lf/local/
> $(sandbox-root)/lf/local/include.mk
>>    per-repository targets and logic to customize makefile behavior.

> $(sandbox-root)/lf/bridge.mk
>>    Temporary makefile to help with transition to repo:onf-make.
>>    Slowly replace include makefiles/* with include lf/onf-make/makefiles/*
