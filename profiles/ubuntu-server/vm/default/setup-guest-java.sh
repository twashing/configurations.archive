
# Java 
echo; echo ">> Installing Java..."
sudo apt-get -y install python-software-properties &&

sudo add-apt-repository -y ppa:webupd8team/java &&
sudo apt-get update &&
sudo apt-get -y --force-yes install oracle-java9-installer
