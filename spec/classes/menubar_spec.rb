require 'spec_helper'

describe 'osx::menubar' do
  it do
    should contain_exec('killall SystemUIServer').with( {:refreshonly => true} )
  end
end
