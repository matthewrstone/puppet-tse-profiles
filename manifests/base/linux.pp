class profile::base::linux(){
  [
    'vim',
    'git',
    'mlocate'
  ].each | $pkg | {
    package { $pkg : ensure => present }
  }
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
