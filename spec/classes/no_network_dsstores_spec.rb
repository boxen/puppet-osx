require 'spec_helper'

describe 'osx::no_network_dsstores' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should contain_boxen__osx_defaults('Do not create .DS_Store on network shares').with({
      :key    => 'DSDontWriteNetworkStores',
      :domain => 'com.apple.desktopservices',
      :value  => true,
      :user   => facts[:boxen_user]
    })
  end
end
