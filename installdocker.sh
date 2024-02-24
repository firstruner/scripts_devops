echo
echo "[[[   - INSTALLATION DES PACKAGES -   ]]]"
echo
sudo apt-get update
sudo apt-get install -y apt-transport-https
sudo apt-get install -y docker.io
echo
echo "[[[   - DEMARRAGE DU SERVICE -   ]]]"
echo
sudo systemctl start docker
sudo systemctl enable docker
echo
echo "[[[   - PARAMETRAGE DU SERVICE -   ]]]"
echo
sudo setfacl --modify user:$USER:rw /var/run/docker.sock
sudo systemctl status docker | egrep eunning;
echo
echo "[[[   - RECUPERATION D'IMAGES -   ]]]"
echo
docker pull hello-world
docker pull httpd
