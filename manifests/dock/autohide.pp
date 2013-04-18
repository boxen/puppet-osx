# Public: Causes the dock to hide itself when you're not pointing at it.
class osx::dock::autohide {
  include osx::dock

  boxen::osx_defaults { 'Automatically hide the dock':
    user   => $::boxen_user,
    key    => 'autohide',
    domain => 'com.apple.dock',
    value  => true,
    notify => Exec['killall Dock'];
  }
}
