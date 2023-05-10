# Configure hosts file
echo -e "--------"
echo -e "----Configure hosts file----"
echo "192.168.89.141   node1.local node1" >> /etc/hosts
echo "192.168.89.142   node2.local node2" >> /etc/hosts
echo "192.168.89.143   node3.local node3" >> /etc/hosts

# Install initial software
echo -e "--------"
echo -e "----Install initial software----"
sudo apt-get update
sudo apt upgrade -y
sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates jq -y

# Preserve history
echo -e "--------"
echo -e "----Preserve history----"
echo 'PROMPT_COMMAND="history -a;$PROMPT_COMMAND"' >> /home/vagrant/.bashrc