class profile::docker() {
  include docker
  docker::run { 'nginx' :
    image => 'nginx',
    ports => ['80:80'],
  }
}
