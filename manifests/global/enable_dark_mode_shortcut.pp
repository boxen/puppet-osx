# Public: Enables dark mode toggler shortcut
class osx::global::enable_dark_mode_shortcut {
  boxen::osx_defaults { 'Enable "dark mode" shortcut':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => '_HIEnableThemeSwitchHotKey',
    value  => true,
    type   => bool,
    user   => $::boxen_user;
  }
}
