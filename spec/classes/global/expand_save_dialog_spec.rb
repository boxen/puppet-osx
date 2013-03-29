require 'spec_helper'

describe 'osx::global::expand_save_dialog' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should contain_boxen__osx_defaults('Expand save panel by default').with({
      :key    => 'NSNavPanelExpandedStateForSaveMode',
      :domain => 'NSGlobalDomain',
      :value  => true,
      :user   => facts[:boxen_user]
    })
  end
end
