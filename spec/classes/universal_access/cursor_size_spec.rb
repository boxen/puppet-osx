require 'spec_helper'

describe 'osx::universal_access::cursor_size' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should contain_boxen__osx_defaults('cursor size').with_value(1.5)
  end

  describe 'with parameters' do
    let(:params) { {:zoom => 2} }

    it 'allows you to pass a zoom value' do
      should contain_boxen__osx_defaults('cursor size').with({
          :domain => 'com.apple.universalaccess',
        :key    => 'mouseDriverCursorSize',
        :value  => params[:zoom],
        :user   => facts[:boxen_user]
      })
    end
  end
end
