# VM-Configuration of the docker server. 

# Turn off interfering services
include interfering_services

# Install and enable ntp
include ntp

# Disable THP and add to rc.local
include disablethp

# remove ALL unmanaged host resources
resources { 'host': purge => true }

# Ensure that servers can find themselves even in absence of dns
class { 'etchosts':
  ownhostname => 'docker.lab'
}

# add epl repo
include epl

# all yum commands
include yum

# Establish ordering
Class['disablethp'] -> Class['interfering_services'] -> Class['ntp'] -> Class['etchosts'] -> Class['epl'] -> Class['yum'] -> Class['vim'] -> Class['htop'] -> Class['docker-io'] -> Class['docker-io-vim'] -> Class['docker-io-logrotate']
