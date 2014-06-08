# Public: Define action for a hot corner
#
# Parameters
#
#  action: Action of the hot corner
#    ['Mission Control'|'Application Windows'|'Desktop'|'Start Screen Saver'|'Disable Screen Saver'|'Dashboard'|'Put Display to Sleep'|'Launchpad'|'Notification Center']
#
#  position: Position of the hot corner (default value: $name)
#    ['Top Left'|'Top Right'|'Bottom Left'|'Bottom Right']
#
# Examples
#
#   osx::dock::hot_corner { 'Name':
#     $action => 'Desktop'
#     $position => 'Top Left'
#   }
#
#   osx::dock::hot_corner { 'Top Right':
#     $action => 'Desktop'
#   }
#
define osx::dock::hot_corner (
  $action = undef,
  $position = $name
) {
  include osx::dock

  validate_re($position, ['Top Left', 'Top Right', 'Bottom Left', 'Bottom Right'])
  validate_re($action, ['Mission Control', 'Application Windows', 'Desktop', 'Start Screen Saver', 'Disable Screen Saver', 'Dashboard', 'Put Display to Sleep', 'Launchpad', 'Notification Center'])

  $position_value = $position ? {
    'Top Left' => 'tl',
    'Top Right' => 'tr',
    'Bottom Left' => 'bl',
    'Bottom Right' => 'br'
  }

  $action_value = $action ? {
    'Mission Control' => 2,
    'Application Windows' => 3,
    'Desktop' => 4,
    'Start Screen Saver' => 5,
    'Disable Screen Saver' => 6,
    'Dashboard' => 7,
    'Put Display to Sleep' => 10,
    'Launchpad' => 11,
    'Notification Center' => 12
  }

  boxen::osx_defaults { "Hot Corners ${position} Action":
    domain => 'com.apple.dock',
    key    => "wvous-${position_value}-corner",
    type   => int,
    value  => $action_value,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }

  boxen::osx_defaults { "Hot Corners ${position} Modifier":
    domain => 'com.apple.dock',
    key    => "wvous-${position_value}-modifier",
    type   => int,
    value  => 0,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }
}
