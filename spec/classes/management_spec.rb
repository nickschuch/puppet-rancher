require 'spec_helper'

describe 'rancher::management' do
  it {
    is_expected.to contain_docker__image('rancher/server')
  }
  context 'with default parameter' do
    it {
      is_expected.to contain_docker__run('rancher/server').with({
        'image'   => 'rancher/server',
        'ports'   => ['8080:8080'],
        'require' => 'Docker::Image[rancher/server]'
      })
    }
  end
  context 'with rancher_manager_port => 9080' do
    let(:params) {{
      :rancher_manager_port => '9080',
    }}
    it {
      is_expected.to contain_docker__run('rancher/server').with({
        'image'   => 'rancher/server',
        'ports'   => ['9080:8080'],
        'require' => 'Docker::Image[rancher/server]'
      })
    }
  end
  context 'with database_host => mysql.example.com' do
    let(:params) {{
      :database_host     => 'mysql.example.com',
      :database_port     => '3306',
      :database_username => 'username',
      :database_password => 'password',
      :database_name     => 'cattle',
    }}
    it {
      is_expected.to contain_docker__run('rancher/server').with({
        'image'   => 'rancher/server',
        'require' => 'Docker::Image[rancher/server]',
        'env'     => [
          'CATTLE_DB_CATTLE_MYSQL_HOST=mysql.example.com',
          'CATTLE_DB_CATTLE_MYSQL_PORT=3306',
          'CATTLE_DB_CATTLE_MYSQL_NAME=cattle',
          'CATTLE_DB_CATTLE_USERNAME=username',
          'CATTLE_DB_CATTLE_PASSWORD=password',
        ],
      })
    }
  end
end
