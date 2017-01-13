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
end
