curl -sLS https://get.k3sup.dev | sh
sudo install k3sup /usr/local/bin/

k3sup --help

k3sup install --ip 192.168.3.9 --user ubuntu
# k3sup join --ip 192.168.3.9 --server-ip 158.101.151.83 --user ubuntu --server-user opc 
