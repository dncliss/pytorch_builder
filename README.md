## Introduction to OSUOSL pytorch_builder scripts
 
This repository provides build scripts for execution of pytorch CI builds on the ppc64le platform at
the Oregon State University Open Source Lab (OSUOSL). The scripts are available under the
[Apache V2 license](LICENSE).
This license applies only to these build scripts; pytorch itself is a separately-licensed project.

For information about the OSU Open Source Lab, see: https://osuosl.org <br>

For the pytorch source repository that is built by these scripts, see: https://github.com/pytorch/pytorch


### OSUOSL CI Build Environment

The OSUOSL Power CI builds are based on the Jenkins Docker Custom Build Environment. For information about
the CI at OSUOSL, see their documentation on the topic: https://wiki.osuosl.org/powerci/docker.html
These CI builds are thus performed in a Docker container. The container used will be something like 
`osuosl/ubuntu-ppc64le-cuda:10.2-cudnn7` (for example). The Docker images provided by OSUOSL are
available from https://hub.docker.com/u/osuosl

A list of various Jenkins CI project builds for Power, which include pytorch among various other project builds,
can be seen here: https://powerci.osuosl.org

The OSUOSL CI is set up to perform nightly builds on the upstream github version of pytorch
on the Power (ppc64le) platform. (Note: "ppc64le" is the architecture designation for "Power 64-bit,
little-endian").

Useful links for reference are:<br>
Overall Jenkins table of ppc64le builds at OSUOSL: <br>
	https://powerci.osuosl.org/ <br>
PPC64LE CPU link to latest python 3.7 build: <br>
	https://powerci.osuosl.org/job/pytorch-master-nightly-py3-linux-ppc64le/ <br>
PPC64LE GPU link to latest python 3.7 build: <br>
	https://powerci.osuosl.org/job/pytorch-master-nightly-py3-linux-ppc64le-gpu/ <br>

From the overall jenkins table, you can see the other builds listed here; just
look at the ones starting with the "pytorch" name. The two builds above are the ones that the official
pytorch project [README](https://github.com/pytorch/pytorch#readme) points to in its build status
table. Any other instances of pytorch builds that appear on the Jenkins table should be ignored as they
are temporary, created and removed over time for debugging or experimentation purposes.

### GIT scripts

Other info to note:  The Github tree from this github repository was forked from an earlier
version at https://github.com/avmgithub/pytorch_builder

This newer repository has a few minor updates and has been in use since mid-2019 (through at least
Apr-2021 and beyond, at the time of of this writing): <br>
	https://github.com/dncliss/pytorch_builder

Subdirectories found here: <br>
[ci](ci) - Dockerfiles and build scripts for GPU-based CI at OSUOSL. <br>
[ci_cpu](ci_cpu) - Dockerfiles and build scripts for CPU-based CI at OSUOSL.

See README.md in each sub-directory to learn more.


### Requesting access to OSUOSL lab:

Requests to create an account and get access to the CI environment are limited and must be approved. To
request access, from the OSUOSL home page, proceed to the request form found via SERVICES -->
"PowerLinux/OpenPOWER Development Hosting" --> "PowerCI Request Form".


### General tips: Hands-on execution and debug of the OSU Jenkins jobs

This section is only of interest if you have been granted access. First, of course,
make sure you are logged in.  When you visit the main OSU Jenkins dashboard, look for
a "log in" button in the upper right.

From The Jenkins table page, on the left, select "My Views"
Notice all pytorch* items.  Select one that you want to work with.
Most likely you will want to view the output results via the "Console" link. <br>
Also, on the left side menu options, look for the "Configure" link.  Here you can see the build
options, docker image, scripts to be executed, etc.  You don't want to change
anything here unless you are ready for it to become an official change to how we are
doing the build. <br>
Recommended instead: If you want to debug or try different options, you can copy
this build to a new job, and then experiment with the new copy.  It will create a new item
on the dashboard, which you can then test with.  When done, you can delete it or save for
subsequent debugging if needed.

How would you do this?
An example will illustrate: <br>
From the dashboard, if you are logged in, on the upper left you will see a "New Item" choice.
Select this. You'll see a box that says "Enter an item name".  Name your new
experimental build, e.g. "pytorch-py3-gpu_MY_DEBUG" or something of your choosing.
Now scroll down to the bottom and notice the "Copy from" option.  Start typing "pytorch" here
and a menu of other builds starting with that name will appear.  Select the one you want to
copy, and click "OK".  Now when you go back to your dashboard, you can select your new build
and select "Configure", and then change whatever options you want to from here.  If you change
nothing, it is an exact copy of the CI build you copied from, aside from the name.

