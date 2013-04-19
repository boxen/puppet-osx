# Public: Sets the icons's size
class osx::dock::icon_size($size = 36) {
  include osx::dock

  boxen::osx_defaults { 'icon size':
    domain => 'com.apple.dock',
    key    => 'tilesize',
    value  => $size,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }
}
