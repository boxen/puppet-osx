# Public: Disables the dock by setting a long autohide-delay
class osx::dock::disable {
  include osx::dock

  boxen::osx_defaults { 'Disable the dock':
    user   => $::boxen_user,
    key    => 'autohide-delay',
    domain => 'com.apple.dock',
    value  => 999999,
    notify => Exec['killall Dock'];
  }
}
