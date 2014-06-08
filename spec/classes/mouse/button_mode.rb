require 'spec_helper'

describe 'osx::mouse::button_mode' do
  let(:facts) { {:boxen_user => 'ieatbees'} }

  it 'os x defaults' do
    should contain_boxen__osx_defaults('Set the button mode for multitouch mice').with({
      :key    => 'MouseButtonMode',
      :domain => 'com.apple.driver.AppleBluetoothMultitouch.mouse',
      :value  => 'OneButton',
      :user   => facts[:boxen_user],
      :type   => 'string'
    })
  end

  describe 'with parameters' do
    let(:params) { {:mode => 2} }
    it do
      should contain_boxen__osx_defaults('Set the button mode for multitouch mice').with({
        :key    => 'MouseButtonMode',
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.mouse',
        :value  => 'TwoButton',
        :user   => facts[:boxen_user],
        :type   => 'string'
      })
    end
  end

end
