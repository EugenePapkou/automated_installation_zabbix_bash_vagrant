Vagrant.configure("2") do |config|
  config.vm.box = "centos-7.4-x86_64-minimal"

  config.vm.define "z_server" do |z_server|
  z_server.vm.hostname = "zserver"
  z_server.vm.network "private_network", ip: "192.168.1.2"
  z_server.vm.provision 'shell', path: "script_z_server.sh"
  z_server.vm.provider "virtualbox" do |vb|
    vb.name = "z_server"
    vb.memory = "4096"
  end
  end

  config.vm.define "z_host" do |z_host|
  z_host.vm.hostname = "zhost"
  z_host.vm.network "private_network", ip: "192.168.1.3"
  z_host.vm.provision 'shell', path: "script_z_host.sh"
  z_host.vm.provider "virtualbox" do |vb|
    vb.name = "z_host"
    vb.memory = "2048"
  end
  end
end
