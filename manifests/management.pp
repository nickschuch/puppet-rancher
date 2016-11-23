# Management Server.
class rancher::management(
  $rancher_manager_port     = '8080',
  $docker_cleanup_container = true,
  $docker_cleanup_volume    = false
){
  require docker

  docker::image { 'rancher/server':
  }

  docker::run { 'rancher/server':
    image                     => 'rancher/server',
    ports                     => ["${rancher_manager_port}:8080"],
    require                   => Docker::Image['rancher/server'],
    remove_container_on_start => $docker_cleanup_container,
    remove_volume_on_start    => $docker_cleanup_volume,
    remove_container_on_stop  => $docker_cleanup_container,
    remove_volume_on_stop     => $docker_cleanup_volume,
  }
}
