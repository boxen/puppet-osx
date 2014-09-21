require 'spec_helper'

describe 'osx::menubar::show_battery_percent do
      should contain_boxen__osx_defaults('Shows battery percentage').with({
        :key    => 'ShowPercent',
        :domain => 'com.apple.menuextra.battery',
        :value  => 'YES',
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall SystemUIServer]'
      })
    end
  end
end
