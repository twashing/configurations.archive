# Configurations

Setup for a [NixOS](nixos.org) machine.

## Virtual Machine 

To setup a VM from the vm/default  configuration, you should do the following

- run `./bin/setup-host.sh`

- ***You should now be in the virtual machine***
- run `nix-env -i vim`
- run `nix-env -i wget --fallback`
- run `bash <(curl -fksSL https://raw.githubusercontent.com/twashing/configurations/master/profiles/ubuntu-server/vm/default/setup-guest.sh)` 


## License

Copyright © 2014 Timothy Washington

Distributed under the Eclipse Public License either version 1.0 or (at
your option) any later version.

