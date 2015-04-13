
node /consul/ {

  include common

  $consul_service_array = hiera('sshd',[])
  $ssh_nodes_hash = consul_info($consul_service_array, ['Address'], ':')
  $ssh_nodes = join($ssh_nodes_hash, ', ')

  notify {"SSH server nodes: $ssh_nodes": }

}

node default {

  notify {"I am different!":}

}


## Common resources
class common {

  include repos
  class {'consul':}

}

## Repos
class repos {

  # Process Repositories before anything else
  stage { 'repositories':
    before => Stage['main'],
  }

  exec { 'refresh-yum-cache':
    command     => 'yum makecache',
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    refreshonly => true,
  }

  Yumrepo {
    enabled    => '1',
    gpgcheck   => '0',
    require    => Stage['repositories'],
    notify     => Exec['refresh-yum-cache'],
  }

}

if $::puppetversion >= '3.6.1' {
  Package {
    allow_virtual => true,
  }
}
