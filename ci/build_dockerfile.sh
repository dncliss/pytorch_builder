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

sed s/DOCKER_VERSION/9.2-cudnn7/ Dockerfile.ORG  > Dockerfile
sudo docker build -t docker.io/avmdocker/pytorch-ci:cuda92cudnn7 .

#sed s/DOCKER_VERSION/9.1-cudnn7/ Dockerfile.ORG > Dockerfile
#sudo docker build -t docker.io/avmdocker/pytorch-ci:cuda91cudnn7 .

#sed s/DOCKER_VERSION/8.0-cudnn6/ Dockerfile.ORG > Dockerfile
#sudo docker build -t docker.io/avmdocker/pytorch-ci:cuda8cudnn6 .

#sed s/DOCKER_VERSION/10.0-cudnn7/ Dockerfile.ORG > Dockerfile
#sudo docker build -t docker.io/avmdocker/pytorch-ci:cuda10cudnn7 .

#sudo docker push docker.io/avmdocker/pytorch-ci:cuda10cudnn7
sudo docker push docker.io/avmdocker/pytorch-ci:cuda92cudnn7
#sudo docker push docker.io/avmdocker/pytorch-ci:cuda91cudnn7
#sudo docker push docker.io/avmdocker/pytorch-ci:cuda8cudnn6

rm Dockerfile
