require 'spec_helper'

describe 'osx::dock::disable_dashboard' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::dock')

    should contain_boxen__osx_defaults('Disable the dashboard').with({
      :key    => 'mcx-disabled',
      :domain => 'com.apple.dashboard',
      :value  => true,
      :notify => 'Exec[killall Dock]',
      :user   => facts[:boxen_user]
    })
  end
end
