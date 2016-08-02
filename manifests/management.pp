# Management Server.
class rancher::management(
  $rancher_manager_port = '8080',
){
  require docker

  docker::image { 'rancher/server':
  }

  docker::run { 'rancher/server':
    image   => 'rancher/server',
    ports   => [ "${rancher_manager_port}:8080" ],
    require => Docker::Image['rancher/server'],
    remove_container_on_start => false,
    remove_volume_on_start    => false,
    remove_container_on_stop  => false,
    remove_volume_on_stop     => false,
  }
}
