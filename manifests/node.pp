# Register Docker Node.

class rancher::node (
  $management = undef,
) {

  validate_string($management) 

  docker::run { "rancher_node_${title}":
    image         => 'rancher/agent',
    command       => "http://${management}:8080",
    volumes       => '/var/run/docker.sock:/var/run/docker.sock',
    pull_on_start => true,
  }

}

