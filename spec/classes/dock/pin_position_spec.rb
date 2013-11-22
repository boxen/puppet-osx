require 'spec_helper'

describe 'osx::dock::pin_position' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::dock')
    should contain_boxen__osx_defaults('pin position').with_value('start')
  end

  describe 'with parameters' do
    let(:params) { {:position => 'end'} }

    it 'allows you to pass a position' do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('pin position').with({
        :key    => 'pinning',
        :domain => 'com.apple.dock',
        :value  => 'end',
        :notify => 'Exec[killall Dock]',
        :user   => facts[:boxen_user]
      })
    end
  end
end
