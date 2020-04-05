control 'node configuration environment' do
  title 'should match desired lines'

  describe file('/etc/default/node.sh') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its('mode') { should cmp '0640' }
  end
end
