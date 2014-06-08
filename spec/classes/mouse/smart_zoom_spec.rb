require 'spec_helper'

describe 'osx::mouse::smart_zoom' do
  let(:facts) { {:boxen_user => 'ieatbees'} }

  it 'os x defaults' do
    should contain_boxen__osx_defaults('Enable smart zoom for multitouch mice').with({
      :key    => 'MouseOneFingerDoubleTapGesture',
      :domain => 'com.apple.driver.AppleBluetoothMultitouch.mouse',
      :value  => 0,
      :user   => facts[:boxen_user],
      :type   => 'integer'
    })
  end

  describe 'with parameters' do
    let(:params) { {:enabled => true} }
    it do
      should contain_boxen__osx_defaults('Enable smart zoom for multitouch mice').with({
        :key    => 'MouseOneFingerDoubleTapGesture',
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.mouse',
        :value  => 1,
        :user   => facts[:boxen_user],
        :type   => 'integer'
      })
    end
  end

end
