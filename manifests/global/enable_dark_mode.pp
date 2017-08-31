# Public: Enables dark mode
class osx::global::enable_dark_mode {
  boxen::osx_defaults { 'Enable "dark mode"':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'AppleInterfaceStyle',
    value  => 'Dark',
    type   => string,
    user   => $::boxen_user;
  }
}
