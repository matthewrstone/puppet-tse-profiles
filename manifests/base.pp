class profile::base{
  $hostfile = $kernel ? {
    'Linux'   => '/etc/hosts',
    'windows' => 'c:\\windows\\system32\\drivers\\etc\\hosts',
  }
  @@host { $::hostname :
    ensure       => present,
    comment      => 'Managed by Puppet',
    host_aliases => "${::hostname}.mrs.puppetdemo.net",
    ip           => $::ipaddress,
    target       => $hostfile
  }
  Host <<| |>>
}
