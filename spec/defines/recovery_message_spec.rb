require 'spec_helper'

describe 'osx::recovery_message' do
  let(:title)       { 'foo' }
  let(:kextdir)     { '/System/Library/Extensions' }
  let(:eficachedir) { '/System/Library/Caches/com.apple.corestorage/EFILoginLocalizations' }

  it do
    should contain_exec('Refresh system kext cache').with({
      :command     => "/usr/bin/touch #{kextdir}",
      :creates     => eficachedir,
      :refreshonly => true,
      :user        => 'root'
    })

    should contain_exec('Refresh CoreStorage EFI Cache').with({
      :command     => "/usr/bin/touch #{eficachedir}",
      :onlyif      => "test -d #{eficachedir}",
      :refreshonly => true,
      :user        => 'root'
    })
  end

  context 'given a name' do
    let(:title) { 'If this Mac is found, please call 123-123-1234' }

    it do
      should contain_property_list_key('Set OS X Recovery Message').with({
        :ensure => 'present',
        :path   => '/Library/Preferences/com.apple.loginwindow.plist',
        :key    => 'LoginwindowText',
        :value  => title
      })

      should contain_exec('Set OS X Recovery Message NVRAM Variable').with({
        :command => "nvram good-samaritan-message='#{title}'",
        :unless  => "nvram good-samaritan-message | awk -F'\t' '{ print \$2 }' | grep '^#{title}$'",
        :user    => 'root'
      })
    end
  end

  context 'with ensure => absent' do
    let(:title) { 'foo' }
    let(:params) { {:ensure => 'absent'} }

    it do
      should contain_property_list_key('Remove OS X Recovery Message').with({
        :ensure => 'absent',
        :path   => '/Library/Preferences/com.apple.loginwindow.plist',
        :key    => 'LoginwindowText',
      })

      should contain_exec('Remove OS X Recovery Message NVRAM Variable').with({
        :command => 'nvram -d good-samaritan-message',
        :onlyif  => 'nvram -p | grep good-samaritan-message',
        :user    => 'root'
      })
    end
  end
end
