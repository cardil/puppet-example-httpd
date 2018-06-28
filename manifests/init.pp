# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include httpd
class httpd (
  Httpd::AbsolutePath $wwwdir = $httpd::params::wwwdir,
  ) inherits httpd::params {

  contain httpd::internal::install
  contain httpd::internal::configure
  contain httpd::internal::service

  Class['httpd::internal::install']
  -> Class['httpd::internal::configure']
  ~> Class['httpd::internal::service']

}
