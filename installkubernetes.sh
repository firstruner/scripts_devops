echo "[[[   - INSTALLATION DES PACKAGES -   ]]]"
echo
sudo apt-get install -y apt-transport-https ca-certificates curl
curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl kubelet kubeadm
echo
echo "[[[   - ACTIVATION DE KUBELET -   ]]]"
echo
sudo systemctl enable kubelet
echo
echo "[[[   - INITIALISATION -   ]]]"
echo
sudo kubeadm init
echo
echo "[[[   - PARAMETRAGE -   ]]]"
echo
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
echo
echo "[[[   - INSTALLATION DE CALICO -   ]]]"
echo
kubectl create -f ./scripts_devops/calico.yaml
echo
echo "[[[   - DESACTIVATION DU SWAP -   ]]]"
echo
swapoff -a
echo
echo "[[[   - INSTALLATION DE MINIKUBE -   ]]]"
echo
sudo apt-get install -y libcanberra-gtk-module
sudo setfacl --modify user:$USER:rw /usr/local/share
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start
echo
echo "[[[   - VERIFICATION -   ]]]"
echo
kubectl version
kubectl get pods
kubectl get nodes
