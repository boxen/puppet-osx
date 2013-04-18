require 'spec_helper'

describe 'osx::dock::dim_hidden_apps' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::dock')

    should contain_boxen__osx_defaults('Dim hidden apps').with({
      :key    => 'showhidden',
      :domain => 'com.apple.dock',
      :value  => true,
      :notify => 'Exec[killall Dock]',
      :user   => facts[:boxen_user]
    })
  end
end
