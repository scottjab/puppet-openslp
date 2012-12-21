# Class: openslp
#
#
class openslp (
  $scope,
  $da_addresses,
  $broadcast_only = false,
  $is_da = false,
  $da_sync = false,
  $da_backup = false,
  $da_backup_interval = '900',
  $broadcast_only = false,
  ) inherits openslp::params {
  include openslp::install
  include openslp::config
  include openslp::service
}