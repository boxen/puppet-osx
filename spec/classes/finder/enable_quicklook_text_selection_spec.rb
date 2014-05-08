require 'spec_helper'

describe 'osx::finder::enable_quicklook_text_selection' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::finder')

    should contain_boxen__osx_defaults('Enable Quick Look text selection').with(
      :user   => facts[:boxen_user],
      :domain => 'com.apple.finder',
      :key    => 'QLEnableTextSelection',
      :value  => true,
      :notify => 'Exec[killall Finder]'
    )
  end
end
