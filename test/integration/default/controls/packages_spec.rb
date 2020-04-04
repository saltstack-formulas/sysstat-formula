control 'nodejs package' do
  title 'should be installed'

  describe package('nodejs') do
    it { should be_installed }
  end
end
