require 'spec_helper'

describe 'osx::dock::magnification' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should contain_boxen__osx_defaults('magnification').with({
      :key    => 'magnification',
      :domain => 'com.apple.dock',
      :value  => true,
      :user   => facts[:boxen_user]
    })
  end

  it do
    should contain_boxen__osx_defaults('magnification_size').with({
      :key    => 'largesize',
      :domain => 'com.apple.dock',
      :value  => '128',
      :user   => facts[:boxen_user]
    })
  end

  context 'given false' do
    let(:params) { { :magnification => false } }
    it do
      should contain_boxen__osx_defaults('magnification').with({
        :key    => 'magnification',
        :domain => 'com.apple.dock',
        :value  => false,
        :user   => facts[:boxen_user]
      })
    end
  end

  context 'given a magnification_size' do
    let(:params) { { :magnification_size => 64 } }
    it do
      should contain_boxen__osx_defaults('magnification_size').with({
        :key    => 'largesize',
        :domain => 'com.apple.dock',
        :value  => 64,
        :user   => facts[:boxen_user]
      })
    end
  end

end
