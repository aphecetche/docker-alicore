Basic Docker container to be able to develop Alice software (for Run2 or Run3) in a CentOS 7 environment. 

The idea is that the source code is kept on the host and bind mounted to the container, while the generated stuff
(build, install, etc...) is kept in a Docker volume.

On Mac the input part (i.e. reading the source from the bind mount) does not seem to be perfectly adequate as far as
performance goes. It seems `osxfs` is not yet up to the task... Hopefully that will improve in the future. 

The output part (writing the build files etc...)
on the other hand seems fine.

