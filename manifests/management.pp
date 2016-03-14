# Management Server.

class rancher::management {
  require ::docker

  docker::image { 'rancher/server':
  }

  docker::run { 'rancher_server':
    image   => 'rancher/server',
    ports   => [ '8080:8080' ],
    require => Docker::Image['rancher/server'],
  }

}
