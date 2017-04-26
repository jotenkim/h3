setxkbmap fi
sudo apt-get update
sudo apt-get -y install puppet git
git clone https://github.com/jotenkim/h3.git
cd h3	
bash apply.sh
