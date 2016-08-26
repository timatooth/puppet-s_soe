class s_soe {
  include ::s_soe::users

  file {'/etc/sudoers.d/':
    ensure => directory
  }

  file {'/etc/sudoers.d/80-admin-nopasswd':
    ensure => file,
    source => 'puppet:///modules/s_soe/sudo/80-admin-nopasswd',
    mode   => '0440'
  }

  $standard_packages = ['git','htop']

  if $::osfamily == 'FreeBSD' {
    file {'/etc/motd':
      ensure => present,
      source => 'puppet:///modules/s_soe/motd/unix',
    }
  }

  package {$standard_packages:}

}
