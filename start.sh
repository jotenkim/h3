setxkbmap fi
sudo apt-get update
sudo apt-get -y install puppet git
git clone https://github.com/jotenkim/h3.git
cd h3	
sudo puppet apply --modulepath puppet/modules/ -e 'class {apache:}'
