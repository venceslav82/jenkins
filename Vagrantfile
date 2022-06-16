# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    
  config.ssh.insert_key = false

  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "venceslav_dimitrov/debian-11"
    jenkins.vm.hostname = "vm101.do1.lab"
    jenkins.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "3072"]
      vb.customize ["modifyvm", :id, "--usb", "on"]
      vb.customize ["modifyvm", :id, "--usbehci", "off"]
    end
    jenkins.vm.network "private_network", ip: "192.168.56.101"
	jenkins.vm.network "forwarded_port", guest: 8080, host: 8080
	jenkins.vm.provision "shell", path: "add_hosts.sh"
    jenkins.vm.provision "shell", path: "install_common.sh"
	jenkins.vm.provision "shell", path: "install_jenkins.sh"
  end
  
  config.vm.define "docker" do |docker|
    docker.vm.box="venceslav_dimitrov/debian-11"
    docker.vm.hostname = "vm102.do1.lab"
    docker.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "3072"]
      vb.customize ["modifyvm", :id, "--usb", "on"]
      vb.customize ["modifyvm", :id, "--usbehci", "off"]
    end
    docker.vm.network "private_network", ip: "192.168.56.102"
	docker.vm.provision "shell", path: "add_hosts.sh"
    docker.vm.provision "shell", path: "install_common.sh"
	docker.vm.provision "shell", path: "install_docker.sh"
	docker.vm.provision "shell", path: "install-docker-compose.sh"
	docker.vm.provision "shell", path: "add_jenkins_user.sh"
	docker.vm.provision "shell", path: "install_gitea.sh"

  end
end
