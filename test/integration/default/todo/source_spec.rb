title 'sysstat archives profile'

control 'sysstat source archive' do
  impact 1.0
  title 'should be installed'
  desc "Ensure sysstat source archive was extracted correctly"
  tag: package: "source archive"

  describe file('/opt/local/bin/sar') do      #base_dir
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its('mode') { should cmp '0644' }
  end

  require 'digest'
  binary = file('/tmp/sysstat/sysstat-12.1.5.tar.gz').content
  sha256sum = Digest::SHA256.hexdigest(binary)
  describe file('/opt/sysstat/sysstat-12.1.5.tar.gz') do
    its('sha256sum') { should eq 'd3bbc90194326e93fbc7f63cff20894ea20cd05caee1bc6ada3bf602e06970e4' }
  end
end
