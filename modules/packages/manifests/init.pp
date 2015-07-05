class packages {
package { "vim-enhanced": ensure => "installed" }
package { "htop": ensure => "installed" }
package { "docker-io": ensure => "installed" } 
package { "docker-io-logrotate": ensure => "installed" } 
package { "docker-io-vim": ensure => "installed" } 
  }

  