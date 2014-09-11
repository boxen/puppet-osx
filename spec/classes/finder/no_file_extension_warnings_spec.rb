require 'spec_helper'

describe 'osx::finder::no_file_extension_warnings' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::finder')

    should contain_boxen__osx_defaults('Disable file extension change warnings').with({
      :key    => 'FXEnableExtensionChangeWarning',
      :domain => 'com.apple.finder',
      :value  => false,
      :notify => 'Exec[killall Finder]',
      :user   => facts[:boxen_user]
    })
  end
end
