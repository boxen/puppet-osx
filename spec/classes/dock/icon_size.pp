require 'spec_helper'

describe 'osx::dock::icon_size' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::dock')
    should contain_boxen__osx_defaults('icon size').with_value(36)
  end

  describe 'with parameters' do
    let(:params) { {:size => 1} }

    it 'allows you to pass a size' do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('icon size').with({
        :key    => 'tilesize',
        :domain => 'com.apple.dock',
        :value  => 1,
        :notify => 'Exec[killall Dock]',
        :user   => facts[:boxen_user]
      })
    end
  end
end
