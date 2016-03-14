require 'spec_helper_acceptance'

describe 'shipyard class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work idempotently with no errors' do
      pp = <<-EOS
      class { 'rancher::management':
        rancher_manager_port => "8080",
      }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes  => true)
    end

    describe docker_container('rancher_server') do
      it { should be_running }
    end

    describe docker_image('rancher/server') do
      it { should exist }
    end

    context 'Rancher should be running on the default port' do
      describe command('sleep 5 && echo "Give Rancher time to start"') do
        its(:exit_status) { should eq 0 }
      end

      describe command('curl 0.0.0.0:8080/') do
        its(:stdout) { should match /\<title>rancher<\/title>/ }
      end
    end

  end
end
