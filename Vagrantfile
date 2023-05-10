Vagrant.configure("2") do |config|
  VAGRANT_EXPERIMENTAL="dependency_provisioners"
  # Define the base box to use
  config.vm.box = "ubuntu/jammy64"

  # Create 1 Ubuntu VMs with static IPs
  (1..1).each do |i|
    config.vm.define "Tester#{i}" do |node|
      node.vm.network "private_network", ip: "192.168.89.#{150 + i}"
      node.vm.hostname = "Tester#{i}"
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "6144"
      end

      # Use a different SSH port as if not - default 2222 will collide with other VM's created by vagrantfile
      node.vm.network :forwarded_port, guest: 22, host: 2240 + i

      # Configure custom DNS servers
      if Vagrant.has_plugin?("vagrant-dns")
        node.dns.tld = "local"
        node.dns.patterns = [/^.*$/]
        node.dns.servers = ["8.8.8.8", "8.8.4.4"]
      else
        node.vm.provision "shell",
          inline: "echo 'nameserver 8.8.8.8\nnameserver 8.8.4.4' | sudo tee /etc/resolv.conf"
      end

      config.vm.provision "shell", path: "general_config.sh"
      config.vm.provision "shell", path: "docker_install.sh"
    end
  end

end
