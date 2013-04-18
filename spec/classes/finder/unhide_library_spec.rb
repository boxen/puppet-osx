require 'spec_helper'

describe 'osx::finder::unhide_library' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should contain_exec('Unhide ~/Library').with({
      :command => "chflags nohidden /Users/#{facts[:boxen_user]}/Library",
      :onlyif  => "ls -Ol /Users/#{facts[:boxen_user]} | grep Library | grep hidden"
    })
  end
end
