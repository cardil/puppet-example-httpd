# A description of what this defined type does
#
# @summary A short summary of the purpose of this defined type.
#
# @example
#   httpd::vhost { 'namevar': }
define httpd::vhost(
  Httpd::AbsolutePath $docroot,
  String              $servername      = $name,
  Integer[80, 64000]  $port            = 80,
  Optional[String]    $custom_fragment = '',
) {

  include httpd

  $context = {
    'docroot'         => $docroot,
    'servername'      => $servername,
    'port'            => $port,
    'custom_fragment' => $custom_fragment,
  }
  $vhostdir = $httpd::vhostdir

  file { $docroot:
    ensure => 'directory',
    mode   => '0755',
  }

  file { "${vhostdir}/vhost-${servername}.conf":
    ensure  => 'file',
    mode    => '0644',
    content => epp('httpd/vhost.conf.epp', $context),
    require => [
      Class['httpd::internal::install'],
      File[$docroot],
    ],
    notify  => Class['httpd::internal::service'],
  }
}
