echo
echo "[[[   - Mise à jour du système -   ]]]"
echo
apt-get update & apt-get upgrade
echo
echo "[[[   - Installation des outils -   ]]]"
echo
apt-get install -y cifs-utils psmisc nano
echo
echo "[[[   - Montage -   ]]]"
echo
mkdir /mnt/shared
mount -t cifs //IP/SharedFolder /mnt/shared -o username=user,password=pass,domain=dom
