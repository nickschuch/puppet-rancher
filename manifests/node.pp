# Register Docker Node.

class rancher::node (
  $management = undef,
) {

  validate_string($management) 

  docker::image { 'rancher/agent': }

  docker::run { "rancher_node":
    image   => 'rancher/agent',
    command => "http://${management}:8080",
    volumes => '/var/run/docker.sock:/var/run/docker.sock',
    require => Docker::Image['rancher/agent'],
  }

}

