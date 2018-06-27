Facter.add(:vhosts) do
  setcode do
    confd = Facter.value(:httpd)[:confd]
    cmd = "ls #{confd}/vhost-*.conf"
    ls = Facter::Core::Execution.execute(cmd)
    count = ls.split("\n").size
    { count: count }
  end
end
