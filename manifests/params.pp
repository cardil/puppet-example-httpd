# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include httpd::params
class httpd::params (
  Httpd::AbsolutePath $wwwdir = '/var/www',
  ) {
  $vhostdir = $::facts['os']['family'] ? {
    'Debian' => '/etc/apache2/sites-enabled',
    'RedHat' => '/etc/httpd/conf.d',
  }
  $pkg = $::facts['os']['family'] ? {
    'Debian' => 'apache2',
    'RedHat' => 'httpd',
    default  => fail("Unsupported operating system ${facts[os][name]} ${facts[os][release][full]}")
  }
  $service = $pkg
}
