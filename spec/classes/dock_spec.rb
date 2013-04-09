require 'spec_helper'

describe 'osx::dock' do
  it do
    should contain_exec('killall Dock').with( {:refreshonly => true} )
  end
end
