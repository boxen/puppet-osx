require 'spec_helper'

describe 'osx::dock::clear_dock' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::dock')

    should contain_boxen__osx_defaults('Prevent launchpad from reappearing').with({
      :key    => 'checked-for-launchpad',
      :domain => 'com.apple.dock',
      :value  => true,
      :notify => 'Exec[killall Dock]',
      :user   => facts[:boxen_user]
    })

    should contain_boxen__osx_defaults('Remove all the pinned icons').with({
      :key    => 'persistent-apps',
      :domain => 'com.apple.dock',
      :value  => '()',
      :notify => 'Exec[killall Dock]',
      :user   => facts[:boxen_user]
    })
  end
end
