# Public: Sets the icons's size
# Can be 'start', 'middle', or 'end'
# System Default: 'middle'
class osx::dock::pin_position($position = 'start') {
  include osx::dock

  boxen::osx_defaults { 'pin position':
    domain => 'com.apple.dock',
    key    => 'pinning',
    type   => 'string',
    value  => $position,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }
}
