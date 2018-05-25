class profile::webserver {
  $iis_features = ['Web-WebServer', 'Web-Scripting-Tools']
  iis_feature { $iis_features : ensure => present } ->
  iis_site { 'mywebsite' :
    ensure          => 'started',
    physicalpath    => 'c:\\inetpub\\mywebsite',
    applicationpool => 'DefaultAppPool',
    require         => File['mywebsite'],
  }
  file { 'mywebsite' :
    ensure  => directory,
    source  => 'c:\\badfiles',
    recurse => true,
    path    => 'c:\\inetpub\\mywebsite',
  }

}
