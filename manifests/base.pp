class profile::base{
  $hostfile = $kernel ? {
    'Linux'   => '/etc/hosts',
    'windows' => 'c:\\windows\\system32\\drivers\\etc\\hosts',
  }
  @@host { $build_hostname :
    ensure       => present,
    comment      => 'Managed by Puppet',
    host_aliases => $build_fqdn,
    ip           => $::ipaddress,
    target       => $hostfile
  }
  Host <<| |>>
}
