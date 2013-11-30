# Public: Enable/disable smart zoom for multitouch mice (default = disabled). Requires re-login.
class osx::mouse::smart_zoom($enabled = false) {
  $value = $enabled ? {
    false => 0,
    true  => 1
  }

  boxen::osx_defaults { 'Enable smart zoom for multitouch mice':
    user   => $::boxen_user,
    domain => 'com.apple.driver.AppleBluetoothMultitouch.mouse',
    key    => 'MouseOneFingerDoubleTapGesture',
    value  => $value,
    type   => 'integer'
  }
}