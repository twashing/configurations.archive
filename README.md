# Configurations

My dot and configuration files

## Virtual Machine 

To setup a VM from the vm/default  configuration, you should do the following

- download and install Vagrant
- run `git clone https://github.com/twashing/configurations.git` then cd into `vm/default`
- run `vagrant up && vagrant ssh`
- ***You should now be in the virtual machine***
- run `sudo apt-get -y install curl`
- run `bash <(curl -fksSL https://raw.githubusercontent.com/twashing/configurations/master/vm/default/setup-guest.sh)` ;; this will have a few prompts for Java 


## License

Copyright © 2014 Timothy Washington

Distributed under the Eclipse Public License either version 1.0 or (at
your option) any later version.

