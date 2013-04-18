require 'spec_helper'

describe 'osx::dock::2d' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::dock')

    should contain_boxen__osx_defaults('Use a flat, 2d style for the Dock').with({
      :key    => 'no-glass',
      :domain => 'com.apple.dock',
      :value  => true,
      :notify => 'Exec[killall Dock]',
      :user   => facts[:boxen_user]
    })
  end
end
