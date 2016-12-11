class s_soe::logs (
  $enable = true,
  $syslog_address = 'syslog.timatooth.com:51400'
) {
  $file_ensure = file
  
  package {'rsyslog':
    ensure => present
  }

  if !$enable {
    $file_ensure = absent
  }

  service { 'rsyslog':
    ensure  => 'running',
    enable  => true,
    require => Package['rsyslog'],
  }

  file {'/etc/rsyslog.d/50-elk.conf':
    ensure  => $file_ensure,
    content => template('s_soe/rsyslog-50-elk.conf.erb'),
    notify  => Service['rsyslog']
  }
}
