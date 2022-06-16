echo "##### Add jenkins user and change password"
sudo useradd -m jenkins

sudo usermod -s /bin/bash jenkins

sudo chpasswd <<<"jenkins:Password1"
sudo sh -c "echo \"jenkins ALL=(ALL) NOPASSWD: ALL\" >> /etc/sudoers"
sudo usermod -aG docker jenkins
