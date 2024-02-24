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
sudo usermod -aG docker $USER && newgrp docker
echo
echo "[[[   - VERIFICATION DU SERVICE DOCKER -   ]]]"
echo
sudo systemctl status docker | egrep eunning;
echo
echo "[[[   - RECUPERATION D'IMAGES -   ]]]"
echo
docker pull hello-world
docker pull httpd
echo
read -p "-->> Voulez-vous installer Kubernetes maintenant [y/n] ? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy] ]]; then
  bash $HOME/scripts_devops/installkubernetes.sh
else
  echo " (i) : L'installation peux se faire manuellement ou en lançant le script via : bash $HOME/scripts_devops/installkubernetes.sh"
fi
