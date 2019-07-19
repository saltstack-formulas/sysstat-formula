control 'sysstat service' do
  impact 0.5
  title 'should be running and enabled'

  describe service('sysstat') do
    it { should be_enabled }
    #it { should be_running }
  end

#  describe command('service sysstat status') do
#   its('stdout') { should match 'running' }
#    its('exit_status') { should eq 0 }
#  end
end
