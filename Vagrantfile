# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "ansible" do |ansible|
    ansible.vm.box = "ubuntu/focal64"
    
    ansible.vm.network "forwarded_port", guest: 80, host: 8080

    config.vm.provision "shell", inline: <<-SHELL
      apt update
      apt upgrade -y
      apt install -y ansible
    SHELL
  end

  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "ubuntu/focal64"

    #jenkins.vm.network "forwarded_port", guest: 80, host: 8080
    
    jenkins.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbook.yml"
    end
  end

end
