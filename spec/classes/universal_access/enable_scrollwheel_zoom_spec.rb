require 'spec_helper'

describe 'osx::universal_access::enable_scrollwheel_zoom' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should contain_boxen__osx_defaults('Use mouse wheel (scroll gesture) to zoom').with({
      :key    => 'closeViewScrollWheelToggle',
      :domain => 'com.apple.universalaccess',
      :value  => true,
      :user   => facts[:boxen_user]
    })
  end
end
