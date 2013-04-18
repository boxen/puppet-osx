require 'spec_helper'

describe 'osx::disable_app_quarantine' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should contain_boxen__osx_defaults('Disable the downloaded app quarantine').with({
      :key    => 'LSQuarantine',
      :domain => 'com.apple.LaunchServices',
      :value  => false,
      :user   => facts[:boxen_user]
    })
  end
end
