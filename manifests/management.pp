# Management Server.

class rancher::management {

  docker::image { 'rancher/server': }

  docker::run { 'rancher_server':
    image   => 'rancher/server',
    expose  => [ '8080:8080' ],
    require => Docker::Image['rancher/server'],
  }

}

