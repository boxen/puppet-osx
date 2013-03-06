
class osx::universal_access::enable_scrollwheel_zoom {
  boxen::osx_defaults { 'Use mouse wheel (scroll gesture) to zoom':
    user   => $::boxen_user,
    domain => 'com.apple.universalaccess',
    key    => 'closeViewScrollWheelToggle',
    value  => true;
  }
}
