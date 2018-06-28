# == Class: httpd::internal::install
#
class httpd::internal::install {
  include httpd
  assert_private('private class')

  package { $httpd::pkg:
    ensure => 'installed',
  }
}
