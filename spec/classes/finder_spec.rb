require 'spec_helper'

describe 'osx::finder' do
  it do
    should contain_exec('killall Finder').with( {:refreshonly => true} )
  end
end
