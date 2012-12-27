# Class: openslp::params
#
#
class openslp::params {
  #Check to see if high scope variables are set
  #SLES only right now.
  $service_name = 'slpd'
  $package_name = 'openslp'
  $slp_conf = '/etc/slp.conf'
}