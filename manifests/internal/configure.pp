# == Class: httpd::internal::configure
#
class httpd::internal::configure {
  include httpd
  assert_private('private class')

  $context = {
    'osname'    => $::facts['os']['name'],
    'osversion' => $::facts['os']['release']['full'],
  }

  file { "${httpd::wwwdir}/index.html":
    ensure  => 'file',
    mode    => '0644',
    content => epp('httpd/index.hello.epp', $context),
  }
}
