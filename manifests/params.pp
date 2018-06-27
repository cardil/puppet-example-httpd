# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include httpd::params
class httpd::params (
  $wwwdir = '/var/www',
  ) {
  $vhostdir = $::facts['os']['family'] ? {
    'Debian' => '/etc/apache2/sites-enabled',
    'RedHat' => '/etc/httpd/conf.d',
  }
}
