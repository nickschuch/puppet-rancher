require 'puppetlabs_spec_helper/module_spec_helper'

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

RSpec.configure do |c|
  c.module_path   = File.join(fixture_path, 'modules')
  c.manifest_dir  = File.join(fixture_path, 'manifests')

  # below is the facts hash that gives you the ability to mock
  # facts on a per describe/context block.  If you use a fact in your
  # manifest you should mock the facts below.

  c.default_facts = {
    :osfamily                  => 'RedHat',
    :operatingsystemrelease    => '7.2',
    :operatingsystemmajrelease => '7',
  }

  # add these two lines in a single test block to enable puppet and hiera debug mode

  # Puppet::Util::Log.level = :debug
  # Puppet::Util::Log.newdestination(:console)

  # by default the hiera integration uses hiera data from the shared_contexts.rb file
  # but basically to mock hiera you first need to add a key/value pair
  # to the specific context in the spec/shared_contexts.rb file
  # Note: you can only use a single hiera context per describe/context block
  # rspec-puppet does not allow you to swap out hiera data on a per test block

  # include_context :hiera

end
