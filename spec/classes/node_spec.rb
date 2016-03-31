require 'spec_helper'

describe 'rancher::node' do
  context 'with valid options' do
    let(:params) {{
      :management         => '10.0.1.1',
      :registration_token => 'DB121CFBA836F9493653:1434085200000:2ZOwUMd6fIzz44efikGhBP1veo',
    }}
    it {
      is_expected.to contain_docker__image('rancher/agent')
      is_expected.to contain_docker__run('rancher_node').with({
        'image'   => 'rancher/agent',
        'command' => 'http://10.0.1.1:8080/v1/scripts/DB121CFBA836F9493653:1434085200000:2ZOwUMd6fIzz44efikGhBP1veo',
        'volumes' => [
          '/var/run/docker.sock:/var/run/docker.sock',
          '/var/lib/rancher:/var/lib/rancher',
        ],
       'require'  => 'Docker::Image[rancher/agent]'
      })
    }
  end

  context 'with invalid options' do
    let(:params) {{
    }}
    it { is_expected.to_not compile }
  end
end
