# Class: openslp::config
#
#
class openslp::config {

  #is this needed? Can I reference out of scope variables in templates?
  $scope = $openslp::scope
  $da_addresses = $openslp::da_addresses
  $is_da = $openslp::is_da
  $da_sync = $openslp::da_sync
  $da_backup = $openslp::da_backup
  $da_backup_interval = $openslp::da_backup_interval

  file { $openslp::params::slp_conf:
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => 0644,
    content => template("${module_name}/slp.conf.erb"),
    require => Class['openslp::install'],
    notify => Class['openslp::service'],
  }
}