echo "[[[   - Récupération de Git -   ]]]"
echo
sudo apt-get update
sudo apt-get install -y git
cd $HOME
git clone https://github.com/firstruner/scripts_devops.git
bash $HOME/scripts_devops/installdocker.sh
