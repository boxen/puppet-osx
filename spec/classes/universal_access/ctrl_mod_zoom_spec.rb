require 'spec_helper'

describe 'osx::universal_access::ctrl_mod_zoom' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should contain_boxen__osx_defaults('Use scroll gesture with the Ctrl (^) key to zoom').with({
      :key    => 'HIDScrollZoomModifierMask',
      :domain => 'com.apple.universalaccess',
      :value  => 262144,
      :user   => facts[:boxen_user]
    })
  end
end
