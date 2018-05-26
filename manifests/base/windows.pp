# Windows Base Profile
class profile::base::windows(){
  dsc_xcomputer { $::certname :
    dsc_name => $::build_hostname
  }
  reboot { 'dsc_reboot' : when => pending }
  $hostfile = $kernel ? {
    'Linux'   => '/etc/hosts',
    'windows' => 'c:\\windows\\system32\\drivers\\etc\\hosts',
  }
  @@host { $::fqdn :
    ensure       => present,
    comment      => 'Managed by Puppet',
    host_aliases => $::hostname,
    ip           => $::ipaddress,
    target       => $hostfile
  }
  Host <<| |>>
}
