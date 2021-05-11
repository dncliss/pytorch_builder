
This directory builds docker containers used for the OSU CI for Power with GPUs.

See : https://powerci.osuosl.org/

The pytorch CI builds will start with "pytorch-" <br>
The pytorch-master-nightly-py3-linux-ppc64le-gpu build is the main GPU-based CI build
for which the status is shown on the official pytorch project's README.

The OSU build executes the build_pytorch.sh script from this directory, which in turn
executes the build_pytorch_with_gpu.sh script.
See the osu_config_gpu_example.sh as an example of what is executed from the CI Jenkins
configuration screen.

Other script files here were cloned from the avmgithub/pytorch_builder tree but are no longer
used as a normal part of the CI; these are moved to the archive subdirectory.

