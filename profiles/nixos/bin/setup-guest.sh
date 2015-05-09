
echo -n "Please supply a username: "
read username

export USERNAME=$username
/home/$username/Projects/configurations/profiles/core/bin/setup-guest-postinstall.sh

sudo mv /etc/nixos/configuration.nix{,.1}
sudo ln -s /home/$username/Projects/configurations/profiles/nixos/etc/configuration.nix /etc/nixos/configuration.nix
