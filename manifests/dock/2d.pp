# Public: Disables the 3d dock in favor of a simpler, 2d style.
class osx::dock::2d {
  include osx::dock

  boxen::osx_defaults { 'Use a flat, 2d style for the Dock':
    user   => $::boxen_user,
    key    => 'no-glass',
    domain => 'com.apple.dock',
    value  => true,
    notify => Exec['killall Dock'];
  }
}
