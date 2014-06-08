# Public: Enables Tap to click
class osx::global::tap_to_click {
  boxen::osx_defaults { 'Tap-To-Click Bluetooth':
    ensure => present,
    domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
    key    => 'Clicking',
    value  => true,
    type   => bool,
    user   => $::boxen_user;
  }

  boxen::osx_defaults { 'Tap-To-Click Mouse':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.mouse.tapBehavior',
    value  => 1,
    type   => int,
    user   => $::boxen_user;
  }
}
