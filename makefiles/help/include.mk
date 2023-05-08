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

# Parent makefile should include this early so help
# message will be prefixed by a usage statement.
help ::
	@echo
	@echo "Usage: $(MAKE) [options] [target] ..."

	@echo
	@echo '[ACTION] - golang, java and python'
	@echo '  protos'
	@echo '  build'
	@echo '  test'

	@echo
	@echo '[HELP]'
	@echo '  help                         Display program help'
#	@echo '  help-verbose   Display additional targets and help'

	@echo
	@echo '[PROTOS: generate]'
	@echo '  go-protos'
	@echo '  java-protos'
	@echo '  python-protos'

	@echo
	@echo '[MISC]'
	@echo '  repair                       Recover from a common fatal build condition'

# [EOF]
