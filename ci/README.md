
This directory builds docker containers used for the OSU CI for Power with GPUs.

See : https://powerci.osuosl.org/

The pytorch CI builds will start with "pytorch-" <br>
The pytorch-master-nightly-py3-linux-ppc64le-gpu build is the main GPU-based CI build
for which the status is shown on the official pytorch project's README.

The OSU build executes the build_mpi.sh script from this directory, which in turn
executes the build_nimbix_with_scipy.sh script (which is not accurately named).
See the osu_config_gpu_example.sh as an example of what is executed from the CI Jenkins
configuration screen.

Many other files here are not executed as part of the normal CI build; some are obsolete.
