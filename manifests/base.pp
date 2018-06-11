class profile::base{
  $build_domain     = $trusted['domain']
  $build_hostname   = $trusted['hostname']
  $build_fqdn       = "${build_hostname}.mrs.puppetdemo.net"
  $hostfile = $kernel ? {
    'Linux'   => '/etc/hosts',
    'windows' => 'c:\\windows\\system32\\drivers\\etc\\hosts',
  }
  @@host { $::hostname :
    ensure       => present,
    comment      => 'Managed by Puppet',
    host_aliases => $build_fqdn,
    ip           => $::ipaddress,
    target       => $hostfile
  }
  Host <<| |>>
}
