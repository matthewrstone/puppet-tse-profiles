# Puppet Sales Demo Inf Base
class profile::base::sales_lab_hosts {
  $hostfile = $kernel ? {
    'Linux'   => '/etc/hosts',
    'windows' => 'c:\\windows\\system32\\drivers\\etc\\hosts',
  }
  @@host { $::fqdn :
    ensure       => present,
    comment      => 'Managed by Puppet',
    host_aliases => $::hostname,
    ip           => $::ipaddress,
  }
  Host <<| |>>
}
