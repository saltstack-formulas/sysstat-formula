control 'sysstat package' do
  title 'should be installed'

  describe package('sysstat') do
    it { should be_installed }
  end
end
