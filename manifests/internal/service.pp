# == Class: httpd::internal::service
#
class httpd::internal::service {
  include httpd
  assert_private('private class')

  service { $httpd::service:
    ensure     => 'running',
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
