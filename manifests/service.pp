# Class: openslp::service
#
#
class openslp::service {

  service { $openslp::params::service_name:
    enable => true,
    ensure => running,
    hasrestart => true,
    hasstatus => true,
    require => [Class['openslp::install'],
                Class['openslp::config']],
  }
}