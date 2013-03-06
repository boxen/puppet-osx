
define osx::universal_access::cursor_size($zoom = 1.5) {
  boxen::osx_defaults { 'cursor size':
    user   => $::boxen_user,
    domain => 'com.apple.universalaccess',
    key    => 'mouseDriverCursorSize',
    value  => $zoom;
  }
}
