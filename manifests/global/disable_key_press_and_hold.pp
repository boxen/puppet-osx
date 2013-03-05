
class osx::global::disable_key_press_and_hold {
  boxen::osx_defaults { 'fucking stupid popover':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'ApplePressAndHoldEnabled',
    value  => false,
    user   => $::boxen_user;
  }
}
