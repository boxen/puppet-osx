# Public: Sets the dock position
#
# position - 'bottom', 'top', 'right', 'left'
#
# Examples
#
#   # set the position to be on the bottom
#   include osx::dock::position
#
#   # ...or pick your own position!
#   class { 'osx::dock::position':
#     position => 'left'
#   }
class osx::dock::position($position = 'right') {
  include osx::dock

  boxen::osx_defaults { 'position':
    domain => 'com.apple.dock',
    key    => 'orientation',
    type   => 'string',
    value  => $position,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }
}
