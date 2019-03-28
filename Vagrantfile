# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.define "master" do |master|
        master.vm.box = "centos/7"
        master.vm.hostname = "master"
        master.vm.network :private_network, ip: "192.168.10.15", mac: "5CA1AB1E0001"
        master.vm.network :forwarded_port, guest: 22, host: 2215, id: "ssh", auto_correct:true
        master.vm.network :forwarded_port, guest: 8080, host: 8080, id: "sample-app", auto_correct:true

        # for i in 8000..8999
        #   master.vm.network :forwarded_port, guest: i, host: i
        # end

        master.vm.box_check_update = false
        master.vm.provider "virtualbox" do |v|
            v.memory = 4096
            v.cpus = 2
            v.customize ["modifyvm", :id, "--audio", "none"]
        end
        master.vm.provision "shell", path: "scripts/provision-node.sh"
        master.vm.provision "shell", inline: <<-SHELL

          IP_ADDR=`ip addr show eth1 | grep "inet " | awk '{print $2}' | cut -f1 -d/`
          sudo --user=vagrant docker swarm init --advertise-addr=$IP_ADDR > /home/vagrant/join-command
          cat /home/vagrant/join-command
        SHELL
    end
    config.vm.define "worker1" do |worker1|
        worker1.vm.box = "centos/7"
        worker1.vm.hostname = "worker1"
        worker1.vm.network :private_network, ip: "192.168.10.16", mac: "5CA1AB1E0002"
        worker1.vm.network :forwarded_port, guest: 22, host: 2216, id: "ssh", auto_correct:true
        worker1.vm.box_check_update = false
        worker1.vm.provider "virtualbox" do |v|
            v.memory = 2048
            v.cpus = 1
            v.customize ["modifyvm", :id, "--audio", "none"]
        end
        worker1.vm.provision "shell", path: "scripts/provision-node.sh"
    end
    config.vm.define "worker2" do |worker2|
        worker2.vm.box = "centos/7"
        worker2.vm.hostname = "worker2"
        worker2.vm.network :private_network, ip: "192.168.10.17", mac: "5CA1AB1E0003"
        worker2.vm.network :forwarded_port, guest: 22, host: 2217, id: "ssh", auto_correct:true
        worker2.vm.box_check_update = false
        worker2.vm.provider "virtualbox" do |v|
            v.memory = 2048
            v.cpus = 1
            v.customize ["modifyvm", :id, "--audio", "none"]
        end
        worker2.vm.provision "shell", path: "scripts/provision-node.sh"
    end
end
