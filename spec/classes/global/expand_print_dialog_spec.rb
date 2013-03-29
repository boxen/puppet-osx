require 'spec_helper'

describe 'osx::global::expand_print_dialog' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should contain_boxen__osx_defaults('Expand print panel by default').with({
      :key    => 'PMPrintingExpandedStateForPrint',
      :domain => 'NSGlobalDomain',
      :value  => true,
      :user   => facts[:boxen_user]
    })
  end
end
