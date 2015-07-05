# Ensure that the machines in the cluster can find each other without DNS
class etchosts ($ownhostname) {
  host { 'host_one':
    name  => 'docker.lab',
    alias => ['docker', 'docker.lab'],
    ip    => '192.168.0.101'
  }

 file { 'agent_hostname':
    path    => "/etc/hostname",
    ensure  => present,
    replace => true,
    content => "${ownhostname}", # own hostname
    owner   => 1546
  }

  file { 'agent_sysconfig':
    path    => "/etc/sysconfig/network",
    ensure  => present,
    replace => true,
    content => "NETWORKING=yes \nHOSTNAME=${ownhostname}" # own hostname
  }

}