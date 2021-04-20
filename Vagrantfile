# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "ubuntu/focal64"

    jenkins.vm.hostname = "jenkins"
    jenkins.vm.network "private_network", ip: "10.0.0.11"
    jenkins.vm.network "forwarded_port", guest: 8080, host:8080

    jenkins.ssh.insert_key = false
    jenkins.ssh.private_key_path = [".ssh/jenkins/id_rsa", "~/.vagrant.d/insecure_private_key"]
    #jenkins.vm.provision "file", source: ".ssh/jenkins/id_rsa.pub", destination: "~/.ssh/authorized_keys" 
    jenkins.vm.provision "shell", inline: <<-SHELLL
      #ssh-keygen -y -f /vagrant/.vagrant/machines/ansible/virtualbox/private_key >> /home/vagrant/.ssh/authorized_keys
      #systemctl restart sshd
      cat /vagrant/.ssh/ansible/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
    SHELLL
  end

  config.vm.define "ansible" do |ansible|
    ansible.vm.box = "ubuntu/focal64"
    
    ansible.vm.network :private_network, ip: "10.0.0.10"
    
    ansible.vm.hostname = "ansible"

    ansible.vm.provision "shell", inline: <<-SHELL
      #cp /vagrant/.vagrant/machines/ansible/virtualbox/private_key /home/vagrant/.ssh/id_rsa 
      cp /vagrant/.ssh/ansible/id_rsa /home/vagrant/.ssh/id_rsa
      chown vagrant /home/vagrant/.ssh/id_rsa
      apt update
      apt upgrade -y
      apt install -y ansible
      cd /vagrant/
      su -c '/vagrant/run_ansible.sh' vagrant
    SHELL
  end
end
