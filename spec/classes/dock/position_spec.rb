require 'spec_helper'

describe 'osx::dock::position' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::dock')
    should contain_boxen__osx_defaults('position').with_value('right')
  end

  describe 'with parameters' do
    let(:params) { {:position => 'left'} }

    it 'allows you to pass a position' do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('position').with({
        :key    => 'orientation',
        :domain => 'com.apple.dock',
        :value  => 'left',
        :notify => 'Exec[killall Dock]',
        :user   => facts[:boxen_user]
      })
    end
  end
end
