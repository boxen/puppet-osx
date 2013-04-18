require 'spec_helper'

describe 'osx::finder::empty_trash_securely' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::finder')

    should contain_boxen__osx_defaults('Securely Empty Trash').with({
      :key    => 'EmptyTrashSecurely',
      :domain => 'com.apple.finder',
      :value  => true,
      :notify => 'Exec[killall Finder]',
      :user   => facts[:boxen_user]
    })
  end
end
