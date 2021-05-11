#!/usr/bin/env bash
# *****************************************************************************
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
# *****************************************************************************
#
# NOTE:
#   The following script is not executed directly as such. The commands below
#   this comment are an example of what is placed in the "Build"
#   section of the OSUOSL CI configuration section where it says "Execute shell".
#   These are the commands run as part of the Jenkins CI build when
#   building for GPU.
#
# *****************************************************************************

id 
pwd
ls -l ci
ls -l /home/jenkins
# The scripts we want are in the ci directory; copy to jenkins
sudo -E cp ci/* /home/jenkins
cd /home/jenkins 
export BUILD_ENVIRONMENT=pytorch-ppc64le-cuda10-cudnn7-py3-test
export GIT_REPO=pytorch
export BUILD_ONLY='NO'
export NO_MULTIPROCESSING_SPAWN=1

sudo apt-get update
sudo apt-get -y upgrade

##########
# Switch to compiler v8 (the container provides v7)
echo INSTALLING V8 COMPILER
sudo apt-get -y install g++-8 gcc-8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 80 --slave /usr/bin/g++ g++ /usr/bin/g++-8 --slave /usr/bin/gcov gcov /usr/bin/gcov-8 --slave /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-8 --slave /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-8 --slave /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 --slave /usr/bin/g++ g++ /usr/bin/g++-7 --slave /usr/bin/gcov gcov /usr/bin/gcov-7 --slave /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-7 --slave /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-7 --slave /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-7
sudo dpkg -l g++
ls -l /usr/bin/g++* /usr/bin/gcc*
########## END of compiler version update

ls -l /usr/local/cuda/lib64/libnvrtc.so*
ls -l /usr/lib/powerpc64le-linux-gnu/libcuda.so*

# Make sure there's enough shared memory
free -m
sudo mount -o remount,size=8G /dev/shm

# Redirect core dumps to /tmp
echo '/tmp/core_%e.%p' | sudo tee /proc/sys/kernel/core_pattern

# Build only: Skip tests?
export BUILD_ONLY='YES'
#export CREATE_ARTIFACTS='YES'

# While our build tree uses the branch name "main", github.com/pytorch/pytorch
#  still uses the name "master" so set that name here explicitly
export GIT_BRANCH=origin/master

cd /home/jenkins
sudo -E ./build_pytorch.sh
