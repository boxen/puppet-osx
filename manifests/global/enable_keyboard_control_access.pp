
class osx::global::enable_keyboard_control_access {
  boxen::osx_defaults { 'Enable full keyboard access for all controls':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'AppleKeyboardUIMode',
    value  => 3,
    user   => $::luser;
  }
}

