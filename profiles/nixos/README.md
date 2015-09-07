# Configurations

Setup for a [NixOS](nixos.org) machine.


## Prerequisites
- install virtualbox (https://www.virtualbox.org/wiki/Downloads)
- install vagrant >= 1.65 (https://www.vagrantup.com/downloads.html)
- install vagrant-nixos plugin ("vagrant plugin install vagrant-nixos" or https://github.com/oxdi/vagrant-nixos)


## Virtual Machine 

To setup a VM from the vm/default configuration, you should do the following

- mkdir nixos; cd nixos
- run `./bin/setup-host.sh`

- ***You should now be in the virtual machine***
- run these commands
```
nix-env -i vim &&
nix-env -f '<nixpkgs>' -iA emacs &&
nix-env -i wget --fallback
```

- now setup your gues with this script
```
bash <(curl -fksSL https://raw.githubusercontent.com/twashing/configurations/master/profiles/nixos/bin/setup-guest.sh)
```


## License

Copyright © 2014 Timothy Washington

Distributed under the Eclipse Public License either version 1.0 or (at
your option) any later version.

