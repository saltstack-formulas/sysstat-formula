control 'sysstat configuration' do
  title 'should match desired lines'

  describe file('/etc/default/sysstat') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its('mode') { should cmp '0644' }
    its('content') { should include 'Default settings for ' }
    its('content') { should include 'ENABLED' }
  end
end
