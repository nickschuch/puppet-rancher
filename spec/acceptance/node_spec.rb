require 'spec_helper_acceptance'

describe 'rancher::node' do
  context 'puppet apply' do
    it 'is expected to apply with no errors' do
      pp = <<-EOS
class { 'rancher::node':
  management         => '10.0.1.1',
  registration_token => 'DB121CFBA836F9493653:1434085200000:2ZOwUMd6fIzz44efikGhBP1veo',
}
EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end
end
