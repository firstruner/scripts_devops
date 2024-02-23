sudo apt-get update
sudo apt-get install -y apt-transport-https git
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo setfacl --modify user:$USER:rw /var/run/docker.sock
sudo systemctl status docker
