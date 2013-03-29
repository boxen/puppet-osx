require 'spec_helper'

describe 'osx::global::enable_keyboard_control_access' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should contain_boxen__osx_defaults('Enable full keyboard access for all controls').with({
      :key    => 'AppleKeyboardUIMode',
      :domain => 'NSGlobalDomain',
      :value  => 3,
      :user   => facts[:boxen_user]
    })
  end
end
