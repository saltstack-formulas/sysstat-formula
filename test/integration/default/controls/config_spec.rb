control 'sysstat configuration' do
  title 'should match desired lines'

  describe file('/etc/default/sysstat.ini') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its('mode') { should cmp '0640' }
    its('content') { should include 'Default settings for ' }
    its('content') { should include 'ENABLED' }
    its('content') { should include 'SA1_OPTIONS="-S DISK"' }

  end
end
