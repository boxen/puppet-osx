# Public: Sets the size of the cursor.
#
# zoom - the factor by which the cursor will be zoomed. Defaults to 1.5.
#
# Examples
#
#   # set the cursor zoom to 1.5 (the default)...
#   include osx::universal_access::cursor_size
#
#   # ...or pick your own multiplier!
#   class { 'osx::universal_access::cursor_size':
#     zoom => 2
#   }
class osx::universal_access::cursor_size($zoom = 1.5) {
  boxen::osx_defaults { 'cursor size':
    user   => $::boxen_user,
    domain => 'com.apple.universalaccess',
    key    => 'mouseDriverCursorSize',
    value  => $zoom;
  }
}
