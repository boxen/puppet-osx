require 'spec_helper'

describe 'osx::sound::interface_sound_effects' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'default' do
    it do
      should contain_boxen__osx_defaults('Manage interface sound effects').with({
        :key    => 'com.apple.sound.uiaudio.enabled',
        :domain => 'com.apple.systemsound',
        :value  => 1,
        :user   => facts[:boxen_user]
      })
    end
  end

  describe 'enable' do
    let(:params) { {:enable => true} }
    it do
      should contain_boxen__osx_defaults('Manage interface sound effects').with({
        :key    => 'com.apple.sound.uiaudio.enabled',
        :domain => 'com.apple.systemsound',
        :value  => 1,
        :user   => facts[:boxen_user]
      })
    end
  end

  describe 'disable' do
    let(:params) { {:enable => false} }
    it do
      should contain_boxen__osx_defaults('Manage interface sound effects').with({
        :key    => 'com.apple.sound.uiaudio.enabled',
        :domain => 'com.apple.systemsound',
        :value  => 0,
        :user   => facts[:boxen_user]
      })
    end
  end
end
