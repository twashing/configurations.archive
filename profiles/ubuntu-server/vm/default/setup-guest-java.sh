
# Java 
echo; echo ">> Installing Java..."
sudo add-apt-repository -y ppa:webupd8team/java &&
    sudo apt-get update &&
    sudo apt-get -y --force-yes install oracle-java8-installer
