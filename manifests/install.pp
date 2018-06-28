# == Class: httpd::install
#
class httpd::install {
  # resources
  $pkg = $::facts['os']['family'] ? {
    'Debian' => 'apache2',
    'RedHat' => 'httpd',
    default  => fail("Unsupported operating system ${facts[os][name]} ${facts[os][release][full]}")
  }

  package { $pkg:
    ensure => 'installed',
  }

  notify { 'install-apache':
    message => 'Installing Apache2',
  }
}
