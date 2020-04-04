title 'node archives profile'

control 'node source archive' do
  impact 1.0
  title 'should be installed'
  desc "Ensure node source archive was extracted correctly"
  tag: package: "source archive"

  describe file('/opt/local/bin/node') do      #base_dir
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

end
