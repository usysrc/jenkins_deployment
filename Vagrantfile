# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|


  config.vm.define "ansible" do |ansible|
    ansible.vm.box = "ubuntu/focal64"
    
    ansible.vm.network :private_network, ip: "10.0.0.10"
    
    ansible.vm.hostname = "ansible"

    ansible.vm.provision "shell", inline: <<-SHELL
      cp /vagrant/.vagrant/machines/ansible/virtualbox/private_key /home/vagrant/.ssh/id_rsa 
      chown vagrant /home/vagrant/.ssh/id_rsa
      apt update
      apt upgrade -y
      apt install -y ansible
      ansible-playbook /vagrant/playbook.yml
    SHELL
  end
  
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "ubuntu/focal64"

    jenkins.vm.hostname = "jenkins"
    jenkins.vm.network :private_network, ip: "10.0.0.11"
  
    jenkins.vm.provision "shell", inline: <<-SHELLL
      ssh-keygen -y -f /vagrant/.vagrant/machines/ansible/virtualbox/private_key >> /home/vagrant/.ssh/authorized_keys
      systemctl restart sshd
    SHELLL

    #jenkins.vm.network "forwarded_port", guest: 80, host: 8080
    
    #jenkins.vm.provision "ansible" do |ansible|
    #  ansible.playbook = "playbook.yml"
    #end
  end


end
