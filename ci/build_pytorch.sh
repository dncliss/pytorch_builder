#!/bin/bash
# *************************************************************************
# (C) Copyright IBM Corp. 2018,2021. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# *************************************************************************
set -xe

# Default variable settings
DISTRO=`awk -F= '/^NAME/{print $2}' /etc/os-release`
PYTHON_VERSION=${PYTHON_VERSION:=3}
CREATE_ARTIFACTS=${CREATE_ARTIFACTS:=NO}
GIT_REPO=${GIT_REPO:=pytorch}
GIT_BRANCH=${GIT_BRANCH:=master}

#
# Actual build happens in script below; current script is just a set-up wrapper.
#
./build_pytorch_with_gpu.sh  pytorch HEAD ${GIT_BRANCH} foo ${PYTHON_VERSION} LINUX ${BUILD_ONLY} ${CREATE_ARTIFACTS} ${GIT_REPO}
