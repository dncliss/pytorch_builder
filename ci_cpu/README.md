
Files in this directory are used in OSU CI for CPU only.

OSU has pre-built Docker images ; see https://github.com/osuosl/osl-dockerfiles/tree/master/ubuntu-ppc64le-cuda .<br>
The images are used in the OSU CI environment. When used with the scripts here, they will build/test CPU-only builds
of the pytorch master branch on Power.

If logged in at OSU, see CPU only tests configuration here:  <br>
https://powerci.osuosl.org/job/pytorch-master-nightly-py3-linux-ppc64le/configure <br>

In the configuration, the "Docker image to use" id tag box specifies which Docker image to use
An example is: osuosl/ubuntu-ppc64le-cuda:10.2-cudnn7 <br>
The docker image name indicates the cuda and cudnn versions used.

The CI configuration clones this directory and executes the ./ci_cpu/build_pytorch_cpu.sh with some arguments
to execute the build and test inside the docker container. Other script files here were cloned from the
avmgithub/pytorch_builder tree but are no longer used as a normal part of the CI; these are moved to
the archive subdirectory.

See the osu_config_example.sh as an example of what is executed from the CI Jenkins
configuration screen.
