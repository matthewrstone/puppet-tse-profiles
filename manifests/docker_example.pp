# Docker nginx Example
class profile::docker_example() {
  docker::run { 'nginx' :
    image => 'nginx',
    ports => ['80:80'],
  }
}
