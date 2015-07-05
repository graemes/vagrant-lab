class yum {
exec
{
"yum-update":
command => "/usr/bin/yum clean all; /usr/bin/yum -q -y update",
timeout => 1800, 
}
}

class vim {
  package { 'vim':
    name   => "vim",
    ensure => present
  }
}

class htop {
  package { 'htop':
    name   => "htop",
    ensure => present
  }
}

class docker-io {
  package { 'docker-io':
    name   => "docker-io",
    ensure => present
  }
}

class docker-io-vim {
  package { 'docker-io-vim':
    name   => "docker-io-vim",
    ensure => present
  }
}

class docker-io-logrotate {
  package { 'docker-io-logrotate':
    name   => "docker-io-logrotate",
    ensure => present
  }
}
 