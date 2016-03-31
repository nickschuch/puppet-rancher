require 'spec_helper'

describe 'rancher::management' do
  let(:params) {{
    :rancher_manager_port => '8080',
  }}
  it {
    is_expected.to contain_docker__image('rancher/server')
    is_expected.to contain_docker__run('rancher_server').with({
      'image'   => 'rancher/server',
      'ports'   => ['8080:8080'],
      'require' => 'Docker::Image[rancher/server]'
    })
  }
end
