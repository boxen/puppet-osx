require 'spec_helper'

describe 'osx::finder::show_warning_before_changing_an_extension' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::finder')

    should contain_boxen__osx_defaults('Show warning before changing an extension').with({
      :key    => 'FXEnableExtensionChangeWarning',
      :domain => 'com.apple.finder',
      :value  => true,
      :notify => 'Exec[killall Finder]',
      :user   => facts[:boxen_user]
    })
  end
end
