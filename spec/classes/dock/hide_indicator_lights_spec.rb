require 'spec_helper'

describe 'osx::dock::hide_indicator_lights' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::dock')

    should contain_boxen__osx_defaults("Don't show lights under running applications").with({
      :key    => 'show-process-indicators',
      :domain => 'com.apple.dock',
      :value  => false,
      :notify => 'Exec[killall Dock]',
      :user   => facts[:boxen_user]
    })
  end
end
