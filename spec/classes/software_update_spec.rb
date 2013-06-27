require 'spec_helper'

describe 'osx::software_update' do
  it do
    should contain_exec('OSX Software Update').with({
      :command  => 'softwareupdate -i -a',
      :schedule => 'update_schedule',
      :timeout  => 0,
      :user     => 'root'
    })
  end

  it do
    should contain_schedule('update_schedule').with({
      :period => 'weekly'
    })
  end
end
