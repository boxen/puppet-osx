require 'spec_helper'

describe 'osx::safari::enable_developer_mode' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should contain_boxen__osx_defaults('enable developer mode').with({
      :key    => 'IncludeDevelopMenu',
      :domain => 'com.apple.Safari',
      :type   => 'bool',
      :value  => true,
      :user   => facts[:boxen_user]
    })
  end
end
