# Management Server.

class rancher::management {

  docker::run { 'rancher_server':
    image         => 'rancher/server',
    expose        => [ '8080:8080' ],
    pull_on_start => true,
  }

}

