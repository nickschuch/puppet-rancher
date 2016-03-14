# Register Docker Node.
class rancher::node (
  $management = undef,
  $registration_token = undef,
  $rancher_master_port = 8080,
) {

  validate_string($management)
  validate_string($registration_token)


  docker::image { 'rancher/agent':
    require => Package['docker'],
  }

  docker::run { 'rancher_node':
    image      => 'rancher/agent',
    privileged => true,
    command    => "http://${management}:${rancher_master_port}/v1/scripts/${registration_token}",
    volumes    => [
      '/var/run/docker.sock:/var/run/docker.sock',
      '/var/lib/rancher:/var/lib/rancher'
    ],
    require    => Docker::Image['rancher/agent'],
  }

}
