# Streaming

This project contains a recreation of a RANC streaming environment. In order to create it, we use a simple wrapper around Vivado called [vivado-git](https://github.com/barbedo/vivado-git). Navigate to that repository and perform the instillation steps if it is not already installed. Then, open Vivado, go to `Tools->Run Tcl Script...`, navigate to `Streaming.tcl` and run. This will create the project with the block diagram. In order to use the project, the necessary IP must be in place. It's easiest if you create a folder to contain all the RANC IP, `$IP_ROOT$`. The following repositories are necessary:

- [rancnetwork](FIXME)
- [tickgenerator](FIXME)
- [axistreampacketbuffer](FIXME)

Clone all these repositories into `$IP_ROOT$` and then open the IP Catalog under the Project Manager. Then, right click on some of the white space within the catalog and click on `Add Repository...`. Then, navigate to `$IP_ROOT` and add that repostiory. After this, it should be possible to generate the bitstream for this project.