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
  package { 'notepadplusplus':
    ensure          => installed,
    source          => 'c:\\files\\npp.7.5.6.installer.x64.exe',
    install_options => ['/S'],
    # install_options => [ '/S', { 'INSTALLDIR' => 'C:\mysql-5.5' } ],
    provider        => windows,
  }

  # Install a chocolatey package
  # 2.17.1
  package { 'git.install' :
    ensure   => '2.16.1.2',
    provider => 'chocolatey',
  }
}
