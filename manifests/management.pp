# Management Server.
class rancher::management(
  $rancher_manager_port = '8080',
){
  require docker

  docker::image { 'rancher/server':
  }

  docker::run { 'rancher/server':
    image   => 'rancher/server:stable',
    ports   => [ "${rancher_manager_port}:8080" ],
    require => Docker::Image['rancher/server:stable'],
  }
}
