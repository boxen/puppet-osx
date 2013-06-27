require 'spec_helper'

describe 'osx::software_update' do
  it do
    should contain_exec('OSX Software Update').with({
      :command => 'softwareupdate -i -a',
      :user => 'root',
      :timeout => 0
    })
  end
end
