# VM-Configuration of the ambari server. It functions as the name node and resource manager.

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
  ownhostname => 'one.cluster'
}

# Install and enable ambari server
class { 'ambari_server':
  ownhostname => 'one.cluster'
}

# Install and enable ambari agent
class { 'ambari_agent':
  ownhostname    => 'one.cluster',
  serverhostname => 'one.cluster'
}

# Establish ordering
Class['disablethp'] -> Class['interfering_services'] -> Class['ntp'] -> Class['etchosts'] -> Class['ambari_server'] -> Class['ambari_agent']
