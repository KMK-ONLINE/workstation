Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"
  #config.vm.network :forwarded_port, guest: 22, host: 2226, id: 'ssh'
  #config.ssh.port = 2226
  #config.ssh.insert_key = false
  #config.ssh.private_key_path = ["~/.ssh/id_rsa", "~/.vagrant.d/insecure_private_key"]
  #config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"
  #config.ssh.username = "vagrant"
  #config.ssh.password = "vagrant"
  #config.ssh.forward_agent = true

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end

end
