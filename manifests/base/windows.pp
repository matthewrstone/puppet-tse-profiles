# Windows Base Profile
class profile::base::windows(){
  dsc_xcomputer { $::certname :
    dsc_name => $::build_hostname
  }
  reboot { 'dsc_reboot' : when => pending }
}
