echo "[[[   - Récupération de Git -   ]]]"
echo
sudo apt-get update
sudo apt-get install -y git gparted
cd $HOME
git clone https://github.com/firstruner/scripts_devops.git
clear
echo
echo
echo "[[[   - PARAMETRAGE DU SYSTEME -   ]]]"
echo
read -p "-->> Voulez-vous ajuster la taille de la partition ? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]
  sudo gparted
fi
echo
read -p "-->> Voulez-vous installer Docker maintenant ? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]
  bash $HOME/scripts_devops/installdocker.sh
  echo
  read -p "-->> Voulez-vous installer Kubernetes maintenant ? " -n 1 -r
  echo    # (optional) move to a new line
  if [[ $REPLY =~ ^[Yy]$ ]
    bash $HOME/scripts_devops/installkubernetes.sh
  fi
fi
