# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include httpd
class httpd {
  include httpd::params

  include httpd::stages
  class { 'httpd::install':
    stage => 'install',
  }
  include httpd::service

  $wwwdir  = $httpd::params::wwwdir

  $context = {
    'osname'    => $::facts['os']['name'],
    'osversion' => $::facts['os']['release']['full'],
  }

  file { "${wwwdir}/index.html":
    ensure  => 'file',
    mode    => '0644',
    content => epp('httpd/index.hello.epp', $context),
    require => Package[$httpd::install::pkg],
  }
}
