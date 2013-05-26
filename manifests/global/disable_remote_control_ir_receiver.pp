# Public: Disable remote control infrared receiver. Requires re-login.
class osx::global::disable_remote_control_ir_receiver {
  boxen::osx_defaults { 'Disable remote control infrared receiver':
    ensure => present,
    domain => '/Library/Preferences/com.apple.driver.AppleIRController',
    key    => 'DeviceEnabled',
    type   => 'boolean',
    value  => false,
    user   => root;
  }
}
