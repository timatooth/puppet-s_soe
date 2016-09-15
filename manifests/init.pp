class s_soe {
  include pupistry
  include ::s_soe::users
  include ntp
  class { 'timezone':
    timezone => 'Pacific/Auckland',
  }

  file {'/etc/sudoers.d/':
    ensure => directory
  }

  file {'/etc/sudoers.d/80-admin-nopasswd':
    ensure => file,
    source => 'puppet:///modules/s_soe/sudo/80-admin-nopasswd',
    mode   => '0440'
  }

  $standard_packages = ['git','htop', 'zsh']

  file {'/etc/motd':
    ensure => present,
    source => 'puppet:///modules/s_soe/motd/unix',
  }

  package {$standard_packages:}

  # Datadog monitoring
  class { '::datadog_agent':
    api_key            => hiera('datadog_api_key', ''),
    puppet_run_reports => false,
  }

}
