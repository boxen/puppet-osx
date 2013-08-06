# Public: Modify 'natural' mouse scrolling (enable or disable). Requires re-login.
class osx::global::natural_mouse_scrolling($enabled = true) {
  boxen::osx_defaults { 'Disable natural mouse scrolling':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.swipescrolldirection',
    type   => 'boolean',
    value  => $enabled,
    user   => $::boxen_user;
  }
}
