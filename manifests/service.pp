# == Class: httpd::service
#
class httpd::service {
  # resources
  include httpd::params
  include httpd::install

  $wwwdir  = $httpd::params::wwwdir
  $service = $httpd::install::pkg

  notify { 'Staring Apache':
    before => Notify['install-apache'],
  }

  service { $service:
    ensure     => 'running',
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => File["${wwwdir}/index.html"],
  }
}
