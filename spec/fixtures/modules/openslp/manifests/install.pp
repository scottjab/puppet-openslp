# Class: openslp::install
#
#
class openslp::install {
  package { $openslp::params::package_name:
    ensure => installed,
  }
}