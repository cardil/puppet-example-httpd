# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include httpd
class httpd {
  include httpd::params
  $pkg = $::facts['os']['family'] ? {
    'Debian' => 'apache2',
    'RedHat' => 'httpd',
    default  => fail("Unsupported operating system ${facts[os][name]} ${facts[os][release][full]}")
  }
  $service = $pkg
  $wwwdir  = $httpd::params::wwwdir

  package { $pkg:
    ensure => 'installed',
  }

  $context = {
    'osname'    => $::facts['os']['name'],
    'osversion' => $::facts['os']['release']['full'],
  }

  file { "${wwwdir}/index.html":
    ensure  => 'file',
    mode    => '0644',
    content => epp('httpd/index.hello.epp', $context),
    require => Package[$pkg],
  }

  service { $service:
    ensure     => 'running',
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => File["${wwwdir}/index.html"],
  }
}
