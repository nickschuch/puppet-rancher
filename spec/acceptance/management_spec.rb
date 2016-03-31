require 'spec_helper_acceptance'

describe 'rancher::management hostclass' do
  describe 'running puppet code' do
    it 'should work with no errors' do
      pp = <<-EOS
      class { 'rancher::management':
        rancher_manager_port => "8080",
      }
      EOS

    # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

  end
end
