# A description of what this defined type does
#
# @summary A short summary of the purpose of this defined type.
#
# @example
#   httpd::vhost { 'namevar': }
define httpd::vhost(
  $docroot,
  $servername      = $name,
  $port            = 80,
  $custom_fragment = '',
) {

  include httpd
  include httpd::params

  $context = {
    'docroot'         => $docroot,
    'servername'      => $servername,
    'port'            => $port,
    'custom_fragment' => $custom_fragment,
  }
  $vhostdir = $httpd::params::vhostdir

  file { $docroot:
    ensure => 'directory',
    mode   => '0755',
  }

  file { "${vhostdir}/vhost-${servername}.conf":
    ensure  => 'file',
    mode    => '0644',
    content => epp('httpd/vhost.conf.epp', $context),
    require => [
      Package[$httpd::pkg],
      File[$docroot],
    ],
    notify  => Service[$httpd::service],
  }
}
