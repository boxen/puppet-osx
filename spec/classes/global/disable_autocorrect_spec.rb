require 'spec_helper'

describe 'osx::global::disable_autocorrect' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should contain_boxen__osx_defaults('Disable autocorrect').with({
      :key    => 'NSAutomaticSpellingCorrectionEnabled',
      :domain => 'NSGlobalDomain',
      :value  => false,
      :user   => facts[:boxen_user]
    })
  end
end
