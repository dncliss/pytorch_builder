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
#   building for CPU  (non-GPU).
#
# *****************************************************************************

export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y curl

sudo rm /etc/apt/sources.list.d/cuda.list
sudo rm /etc/apt/sources.list.d/nvidia-ml.list

sudo apt-get install libopenmpi-dev -y
chmod +x ./ci_cpu/build_nimbix.sh

sudo apt-get -y upgrade

#####
# Switch to compiler v8 if desired (container has v7)
echo INSTALLING V8 COMPILER
sudo apt-get -y install g++-8 gcc-8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 80 --slave /usr/bin/g++ g++ /usr/bin/g++-8 --slave /usr/bin/gcov gcov /usr/bin/gcov-8 --slave /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-8 --slave /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-8 --slave /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 --slave /usr/bin/g++ g++ /usr/bin/g++-7 --slave /usr/bin/gcov gcov /usr/bin/gcov-7 --slave /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-7 --slave /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-7 --slave /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-7
sudo dpkg -l g++
ls -l /usr/bin/g++* /usr/bin/gcc*
########## END of compiler update

# QNNPACK not supported on ppc64le by pytorch
#USE_PYTORCH_QNNPACK=OFF

id
WORKDIR=`pwd`
echo $WORKDIR
ls -l /home/jenkins

export USER=jenkins
export HOME=/home/jenkins

# Build only: Skip tests?
export BUILD_ONLY='YES'
#export CREATE_ARTIFACTS='YES'

# Optional: Debug NCCL issue if needed. Choose one.
#export NCCL_DEBUG=WARN
#export NCCL_DEBUG=TRACE
#export NCCL_DEBUG=INFO

cd $HOME

$WORKDIR/ci_cpu/build_pytorch_cpu.sh  pytorch HEAD master foo 3 LINUX
