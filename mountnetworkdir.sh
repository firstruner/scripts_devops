clear
echo
echo "[[[   - Récupération d'informations -   ]]]"
echo
echo -n "Entrer le chemin réseau (ex.: //192.168.0.1/SharedFolder) : "
read -r sharedpath
echo
echo -n "Entrer le chemin local (ex.: /mnt/monshared) : "
read -r localpath
echo
echo -n "Entrer le nom d'utilisateur : "
read -r uname
echo
echo -n "Entrer le mot de passe : "
read -r upwd
echo
echo -n "Entrer le domaine : "
read -r udomain
clear
echo
echo "[[[   - Mise à jour du système -   ]]]"
echo
apt-get update
apt-get upgrade
echo
echo "[[[   - Installation des outils -   ]]]"
echo
apt-get install -y cifs-utils psmisc nano
echo
echo "[[[   - Montage -   ]]]"
echo
mkdir $localpath
mount -t cifs $sharedpath $localpath -o username=$uname,password=$upwd,domain=$udomain
clear
echo
echo "[[[   - Contenu du dossier $localpath -   ]]]"
echo
cd $localpath
ls
