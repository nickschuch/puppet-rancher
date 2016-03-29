# Management Server.
class rancher::management(
  $rancher_manager_port = '8080',
){

  require ::docker

  docker::image { 'rancher/server':
  }

  docker::run { 'rancher_server':
    image   => 'rancher/server',
    ports   => [ "${rancher_manager_port}:8080" ],
    require => Docker::Image['rancher/server'],
  }

}
