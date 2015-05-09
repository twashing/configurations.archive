
echo -n "Please supply a username: "
read username
export USERNAME=$username

sudo mv /etc/nixos/configuration.nix{,.1}
sudo ln -s /home/$username/Projects/configurations/profiles/nixos/etc/configuration.nix /etc/nixos/configuration.nix

sudo nixos-rebuild switch

mv /home/$username/.bashrc{,.1}
mkdir -p /home/$username/Projects &&

git clone https://github.com/twashing/configurations.git /home/$username/Projects/configurations &&

/home/$username/Projects/configurations/profiles/core/bin/setup-guest-postinstall.sh

