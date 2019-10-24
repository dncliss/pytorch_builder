#!/bin/bash

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
./build_nimbix_with_scipy.sh  pytorch HEAD ${GIT_BRANCH} foo ${PYTHON_VERSION} LINUX ${BUILD_ONLY} ${CREATE_ARTIFACTS} ${GIT_REPO}
