require 'spec_helper'

describe 'osx::finder::show_all_on_desktop' do
  it do
    should include_class('osx::finder::show_hard_drives_on_desktop')
    should include_class('osx::finder::show_external_hard_drives_on_desktop')
    should include_class('osx::finder::show_mounted_servers_on_desktop')
    should include_class('osx::finder::show_removable_media_on_desktop')
  end
end
