# Windows Base Profile
class profile::base::windows(){

  include profile::base
  # Install the chocolatey agent
  include chocolatey

  # Rename the computer
  $build_domain     = $trusted['domain']
  $build_hostname   = $trusted['hostname']
  $build_fqdn       = "${build_hostname}.${build_domain}"
  dsc_xcomputer { 'Rename Computer' :
    dsc_name => $build_hostname
  }
  reboot { 'dsc_reboot' : when => pending }

  # Install an MSI package
  package { 'Notepad++ (64-bit x64)':
    ensure          => installed,
    source          => 'c:\\files\\npp.7.5.6.installer.x64.exe',
    install_options => ['/S'],
    provider        => windows,
  }

  # Install a chocolatey package

  # 2.16.3
  package { 'git.install' :
    ensure   => '2.16.2',
    provider => 'chocolatey',
  }
}
