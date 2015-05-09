
# Leiningen
echo; echo ">> Installing Leiningen..."
mkdir ~/bin   # may already exist
wget -O ~/bin/lein https://raw.github.com/technomancy/leiningen/stable/bin/lein &&
chmod u+x ~/bin/lein &&
~/bin/lein

ln -s ~/Projects/configurations/lein_profiles.clj ~/.lein/profiles.clj &&
