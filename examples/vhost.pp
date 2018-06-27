httpd::vhost { 'blog.suszynski.org':
  docroot => '/var/www/blog-suszynski-org',
}

httpd::vhost { 'admin.suszynski.org':
  docroot         => '/var/www/admin-suszynski-org',
  custom_fragment => '# a custom comment'
}
