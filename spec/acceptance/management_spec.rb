require 'spec_helper_acceptance'

describe 'rancher::management' do
  context 'puppet apply' do
    it 'is expected to apply and be idempotent' do
      pp = <<-EOS
class { 'rancher::management':
  rancher_manager_port => '8080',
}
EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end

  describe docker_image('rancher/server') do
    it { is_expected.to exist }
  end

  describe command('curl 0.0.0.0:8080') do
    it {
      sleep 60 # Give Rancher time to start.
      expect(subject.stdout).to match /self.*0.0.0.0:8080/
    }
  end
end
