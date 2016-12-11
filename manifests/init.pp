class s_soe($send_logs = false, $motd = 'unix') {
  #include pupistry
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

  $standard_packages = ['git','htop', 'zsh', 'bash']

  file {'/etc/motd':
    ensure => present,
    source => "puppet:///modules/s_soe/motd/${motd}",
  }

  ensure_packages($standard_packages)

  # Create shell accounts on the system
  include ::s_soe::users

  if $send_logs {
    include ::s_soe::logs
  }
}
