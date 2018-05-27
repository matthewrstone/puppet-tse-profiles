# Windows Base Profile
class profile::base::windows(){
  $build_domain     = $trusted['domain']
  $build_hostname   = $trusted['hostname']
  $build_fqdn       = "${build_hostname}.${build_domain}"
  dsc_xcomputer { 'Rename Computer' :
    dsc_name => $build_hostname
  }
  reboot { 'dsc_reboot' : when => pending }
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
