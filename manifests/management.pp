# Management Server.
class rancher::management(
  $rancher_manager_port = '8080',
  $database_host        = undef,
  $database_port        = 3306,
  $database_username    = 'cattle',
  $database_password    = 'cattle',
  $database_name        = 'cattle',
){
  require docker

  if ($database_host != undef) {
    $env = [
      "CATTLE_DB_CATTLE_MYSQL_HOST=${database_host}",
      "CATTLE_DB_CATTLE_MYSQL_PORT=${database_port}",
      "CATTLE_DB_CATTLE_MYSQL_NAME=${database_name}",
      "CATTLE_DB_CATTLE_USERNAME=${database_username}",
      "CATTLE_DB_CATTLE_PASSWORD=${database_password}",
    ]
  } else {
    $env = []
  }

  docker::image { 'rancher/server':
  }

  docker::run { 'rancher/server':
    image   => 'rancher/server',
    ports   => [ "${rancher_manager_port}:8080" ],
    env     => $env,
    require => Docker::Image['rancher/server'],
  }
}
