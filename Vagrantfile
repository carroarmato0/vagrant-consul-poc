# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "https://dumps.carroarmato0.be/vagrantboxes/centos-6.6-64b-puppet-vbox.box"

  config.vm.define "consul01" do |consul01|
    consul01.vm.hostname = "consul01.local"
    consul01.vm.network "private_network", ip: "192.168.33.21"
  end

  config.vm.define "consul02" do |consul02|
    consul02.vm.hostname = "consul02.local"
    consul02.vm.network "private_network", ip: "192.168.33.22"
  end

  config.vm.define "consul03" do |consul03|
    consul03.vm.hostname = "consul03.local"
    consul03.vm.network "private_network", ip: "192.168.33.23"
  end

  config.vm.define "consul04" do |consul04|
    consul04.vm.hostname = "consul04.local"
    consul04.vm.network "private_network", ip: "192.168.33.24"
  end


  # Clear firewall rules to allow intermachine communication
  config.vm.provision "shell", inline: "iptables -F", run: "once"

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path     = "manifests"
    puppet.manifest_file      = "site.pp"
    puppet.module_path        = "modules"
    puppet.hiera_config_path  = "hiera.yaml"
    #puppet.options            = "--verbose --debug"
   end

end
