require 'spec_helper'

describe 'osx::global::disable_remote_control_ir_receiver' do
  it do
    should contain_boxen__osx_defaults('Disable remote control infrared receiver').with({
      :domain => '/Library/Preferences/com.apple.driver.AppleIRController',
      :key    => 'DeviceEnabled',
      :user   => 'root',
      :value  => false,
    })
  end
end
