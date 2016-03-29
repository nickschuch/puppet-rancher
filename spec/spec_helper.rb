require 'puppetlabs_spec_helper/module_spec_helper'

# Uncomment this to show coverage report, also useful for debugging
#at_exit { RSpec::Puppet::Coverage.report! }

RSpec.configure do |c|
    c.formatter = 'documentation'
    c.mock_with :rspec
end
