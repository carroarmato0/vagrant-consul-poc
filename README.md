# vagrant-consul-poc

This is a vagrant proof of concept for deploying and running Cluster with Puppet.

## Specs

 - Centos 6.6, 1 cpu, 512MB Ram, 19GB /, 477MB /boot
 - Puppet 3.7.3
 - Vbox 4.3.20
 - Consul


## Setup

The Vagrantfile defines 4 Centos virtual machines.

All machines will have Consul installed and running in server mode.

The consul servers will start an election expecting 4 nodes to form a cluster.

The puppet nodes will be able to lookup data from Consul thanks to a hiera pluggin.

On the first node, consul01 (192.168.33.21), the Consul UI is made available to view its state. ( http://192.168.33.21:8500/ui/ )

The SSH service is being published on all servers and to demonstrate the fetching of dynamic information into Puppet, the nodes will notify the IP addresses of the published SSH services in Consul.

## How to

1. After cloning this repository, don't forget to pull in the submodules!

    <pre>
    git submodule update --init --recursive
    </pre>

2. Fire up the VM's

    <pre>
    vagrant up
    </pre>

3. Provision them

    <pre>
    vagrant provision
    </pre>
