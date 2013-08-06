require 'spec_helper'

describe 'osx::global::natural_mouse_scrolling' do
  let(:facts) { {:boxen_user => 'ieatbees'} }

  it 'os x defaults' do
    should contain_boxen__osx_defaults('Disable natural mouse scrolling').with({
      :key    => 'com.apple.swipescrolldirection',
      :domain => 'NSGlobalDomain',
      :value  => true,
      :user   => facts[:boxen_user]
    })
  end

  describe 'with parameters' do
    let(:params) { {:enabled => false} }
    it do
      should contain_boxen__osx_defaults('Disable natural mouse scrolling').with({
        :key    => 'com.apple.swipescrolldirection',
        :domain => 'NSGlobalDomain',
        :value  => false,
        :user   => facts[:boxen_user]
      })
    end
  end

end
