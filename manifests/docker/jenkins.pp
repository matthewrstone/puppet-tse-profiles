class profile::docker::jenkins {
  include docker

  profile::docker::dockifier { 'jenkins' :
    docker_image   => 'jenkins/jenkins:lts',
    image_version  => 'latest',
    docker_volumes => [ 'jenkins_home' ],
    run_params     => {
      image    => 'jenkins/jenkins:lts', 
      ports    => ['8080:8080', '50000:50000'],
      volumes  => ['jenkins_home:/var/jenkins_home'],
    }
  }
}

