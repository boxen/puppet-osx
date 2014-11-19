require 'spec_helper'

describe 'osx::finder::show_warning_before_emptying_trash' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::finder')

    should contain_boxen__osx_defaults('Show warning before emptying the trash').with({
      :key    => 'WarnOnEmptyTrash',
      :domain => 'com.apple.finder',
      :value  => true,
      :notify => 'Exec[killall Finder]',
      :user   => facts[:boxen_user]
    })
  end
end
