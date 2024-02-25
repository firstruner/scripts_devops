echo
echo "[[[   - Mise à jour du système -   ]]]"
echo
sudo apt-get update & apt-get upgrade
echo
echo "[[[   - Installation des outils -   ]]]"
echo
sudo apt-get install -y cifs-utils psmisc nano
echo
echo "[[[   - Montage -   ]]]"
echo
sudo mkdir /mnt/shared
sudo mount -t cifs //IP/SharedFolder /mnt/shared -o username=user,password=pass,domain=dom
