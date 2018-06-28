# == Class: httpd::stages
#
class httpd::stages {
  stage { 'install': }
  Stage['install'] -> Stage['main']
}
