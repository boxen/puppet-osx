require 'spec_helper'

describe 'osx::dock::disable' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::dock')

    should contain_boxen__osx_defaults('Disable the dock').with({
      :key    => 'autohide-delay',
      :domain => 'com.apple.dock',
      :type   => 'float',
      :value  => 999999,
      :notify => 'Exec[killall Dock]',
      :user   => facts[:boxen_user]
    })
  end
end
