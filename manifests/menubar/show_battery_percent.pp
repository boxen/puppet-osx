# Public: Shows battery percentage
#
# Example
#
#   include osx::menubar::show_battery_percent
#
class osx::menubar::show_battery_percent {
  include osx::menubar

  boxen::osx_defaults { 'Shows battery percentage':
    domain => 'com.apple.menuextra.battery',
    key    => 'ShowPercent',
    type   => 'string',
    value  => 'YES',
    user   => $::boxen_user,
    notify => Exec['killall SystemUIServer'];
  }
}
