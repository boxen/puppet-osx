# Public: Disables keyboard press-and-hold for accented character entry.
class osx::global::disable_key_press_and_hold {
  boxen::osx_defaults { 'Disable press-and-hold for accented characters':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'ApplePressAndHoldEnabled',
    value  => false,
    user   => $::boxen_user;
  }
}
