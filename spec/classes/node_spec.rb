require 'spec_helper'

describe 'rancher::node' do
  # by default the hiera integration uses hiera data from the shared_contexts.rb file
  # but basically to mock hiera you first need to add a key/value pair
  # to the specific context in the spec/shared_contexts.rb file
  # Note: you can only use a single hiera context per describe/context block
  # rspec-puppet does not allow you to swap out hiera data on a per test block
  #include_context :hiera


  # below is the facts hash that gives you the ability to mock
  # facts on a per describe/context block.  If you use a fact in your
  # manifest you should mock the facts below.
  let(:facts) do
    {
      :osfamily                  => 'RedHat',
      :operatingsystemmajrelease => '7',
      :operatingsystemrelease    => '7.1'
    }
  end
  # below is a list of the resource parameters that you can override.
  # By default all non-required parameters are commented out,
  # while all required parameters will require you to add a value
  let(:params) do
    {
      :management => '10.0.1.1',
      :registration_token => 'DB121CFBA836F9493653:1434085200000:2ZOwUMd6fIzz44efikGhBP1veo',
    }
  end
  # add these two lines in a single test block to enable puppet and hiera debug mode
  # Puppet::Util::Log.level = :debug
  # Puppet::Util::Log.newdestination(:console)
  it do
    is_expected.to contain_docker__image('rancher/agent')
  end
  it do
    is_expected.to contain_docker__run('rancher_node').
             with(
                  {
                    'image'=>'rancher/agent',
                    'command'=>'http://10.0.1.1:8080/v1/scripts/DB121CFBA836F9493653:1434085200000:2ZOwUMd6fIzz44efikGhBP1veo',
                    'volumes'=> [
                      '/var/run/docker.sock:/var/run/docker.sock',
                      '/var/lib/rancher:/var/lib/rancher',
                    ],
                   'require'=>'Docker::Image[rancher/agent]'
                   }
                  )
  end
end
