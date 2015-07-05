class epl {
  package { 'epl':
    name   => "epl",
    ensure => present,
    provider => rpm,
    source => "http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm" }

  }

