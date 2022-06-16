#!/bin/bash

#echo "##### Install Java 11"
#sudo apt-get update
#sudo apt-get install fontconfig openjdk-11-jre

echo "##### Add Jenkins repository key"
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "##### Add Jenkins repository"
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "##### Install Jenkins"
apt-get update
apt-get install -y jenkins

echo "##### Adjust jenkins user"
usermod -s /bin/bash jenkins
echo -e 'Password1\nPassword1' | passwd jenkins

echo "##### Adjust group membership"
usermod -aG docker jenkins

echo "##### Restart the service to reflect the mmembership change"
systemctl restart jenkins

echo "--------------------------------------------------------------"
echo "###########   A D M I N   P A S S W O R D   I S:    ##########"
cat /var/lib/jenkins/secrets/initialAdminPassword
echo "--------------------------------------------------------------"