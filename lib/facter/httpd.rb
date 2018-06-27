Facter.add(:httpd) do
  setcode do
    family = Facter.value(:os)['family']
    confd = if family == 'Debian'
              '/etc/apache2/sites-enabled'
            elsif family == 'RedHat'
              '/etc/httpd/conf.d'
            end
    { confd: confd }
  end
end
