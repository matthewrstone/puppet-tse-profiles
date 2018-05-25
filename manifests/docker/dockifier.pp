 define profile::docker::dockifier (
    String $docker_image,
    String $image_version,
    Array $docker_volumes,
    Hash $run_params,
  ) {
    docker::image { $docker_image : ensure => $image_version }
    $docker_volumes.each | $v |{ docker_volume { $v : ensure => present } }
    docker::run { $name : * => $run_params }
  
    Docker::Image <| |> -> Docker_volume <| |> -> Docker::Run <| |>
  }
