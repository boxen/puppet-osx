require 'spec_helper'

describe 'osx::recovery_message' do
  context 'given a name' do
    let(:title) { 'If this Mac is found, please call 123-123-1234' }

    it { should contain_property_list_key('Set OS X Recovery Message').with(
      :ensure => 'present',
      :path   => '/Library/Preferences/com.apple.loginwindow.plist',
      :key    => 'LoginwindowText',
      :value  => title
    )}
  end

  context 'with ensure => absent' do
    let(:title) { 'foo' }
    let(:params) { {:ensure => 'absent'} }

    it do
      should contain_property_list_key('Remove OS X Recovery Message').with({
        :ensure => 'absent',
        :path   => '/Library/Preferences/com.apple.loginwindow.plist',
        :key    => 'LoginwindowText',
      })
    end
  end
end
