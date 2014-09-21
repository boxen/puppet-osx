require 'spec_helper'

describe 'osx::global::tap_to_click' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should contain_boxen__osx_defaults('Tap-To-Click Bluetooth').with({
      :key    => 'Clicking',
      :domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
      :value  => true,
      :user   => facts[:boxen_user]
    })
  end

  it do
    should contain_boxen__osx_defaults('Tap-To-Click Mouse').with({
      :key    => 'com.apple.mouse.tapBehavior',
      :domain => 'NSGlobalDomain',
      :value  => 1,
      :user   => facts[:boxen_user]
    })
  end

  it do
    should contain_boxen__osx_defaults('Tap-To-Click Current Host').with({
      :key    => 'com.apple.mouse.tapBehavior',
      :domain => 'NSGlobalDomain',
      :value  => 1,
      :user   => facts[:boxen_user],
      :host   => 'currentHost'
    })
  end
end
