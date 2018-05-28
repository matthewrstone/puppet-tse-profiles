class profile::base::linux(){
  [
    'vim',
    'git',
    'mlocate'
  ].each | $pkg | {
    package { $pkg : ensure => present }
  }
}
