ENV["LC_ALL"] = "en_US.UTF-8"

KAFKA = 3


Vagrant.configure("2") do |config|


  config.vm.box = "geerlingguy/centos7"
  config.ssh.forward_agent = true # So that boxes don't have to setup key-less ssh
  config.ssh.insert_key = false # To generate a new ssh key and don't use the default Vagrant one

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true

  config.vm.synced_folder "download", "/vagrant/download", create: true
  config.vm.provision :shell, :inline => "echo \"vagrant\"|passwd --stdin vagrant"
  config.vm.provision :shell, :inline => "echo \"vagrant\"|passwd --stdin root"

  (1..KAFKA).each do |i|
    config.vm.define "kafka-lab-#{i}" do |kafka|
      kafka.vm.hostname = "kafka-lab-#{i}"
      kafka.vm.provider "virtualbox" do |vb|
        if i == 1
          vb.memory = "3072"
          vb.cpus = "3"
        else
          vb.memory = "2048"
          vb.cpus = "2"
        end
      end
      kafka.vm.network :private_network, ip: "192.168.10.#{1 + i}", auto_config: true

      if i == KAFKA
        kafka.vm.provision :ansible do |ansible|
          ansible.limit = "zookeeper,kafka,grafana,solutions"
          ansible.playbook = "ansible/cluster.yml"
          ansible.inventory_path = "ansible/inventories/vbox"
        end
      end

    end
  end

end
