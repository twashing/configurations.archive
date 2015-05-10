
sudo mv /etc/nixos/configuration.nix{,.1}
sudo wget -P /etc/nixos/ https://raw.githubusercontent.com/twashing/configurations/master/profiles/nixos/etc/configuration.nix
sudo nixos-rebuild switch


echo -n "Please supply a username: "
read username
export USERNAME=$username

sudo mkdir -p /home/$username/Projects &&
sudo git clone https://github.com/twashing/configurations.git /home/$username/Projects/configurations &&
sudo mv /etc/nixos/configuration.nix{,.2} &&
sudo ln -s /home/$username/Projects/configurations/profiles/nixos/etc/configuration.nix /etc/nixos/configuration.nix &&
sudo /home/$username/Projects/configurations/profiles/core/bin/setup-guest-postinstall.sh

