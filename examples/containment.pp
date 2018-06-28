include httpd

notify { 'Before HTTPD':
  before => Class['httpd'],
}

notify { 'After HTTPD':
  require => Class['httpd'],
}
