require 'spec_helper'

describe 'osx::mouse::swipe_between_pages' do
  let(:facts) { {:boxen_user => 'ieatbees'} }

  it 'os x defaults' do
    should contain_boxen__osx_defaults('Enable swipe between pages for multitouch mice').with({
      :key    => 'AppleEnableMouseSwipeNavigateWithScrolls',
      :domain => 'NSGlobalDomain',
      :value  => false,
      :user   => facts[:boxen_user],
      :type   => 'boolean'
    })
  end

  describe 'with parameters' do
    let(:params) { {:enabled => true} }
    it do
      should contain_boxen__osx_defaults('Enable swipe between pages for multitouch mice').with({
        :key    => 'AppleEnableMouseSwipeNavigateWithScrolls',
        :domain => 'NSGlobalDomain',
        :value  => true,
        :user   => facts[:boxen_user],
        :type   => 'boolean'
      })
    end
  end

end
