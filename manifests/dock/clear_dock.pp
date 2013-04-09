# Public: Clears the dock of 'pinned' application icons.
class osx::dock::clear_dock {
  include osx::dock

  boxen::osx_defaults { 'Prevent launchpad from reappearing':
    user   => $::boxen_user,
    domain => 'com.apple.dock',
    key    => 'checked-for-launchpad',
    value  => true,
    notify => Exec['killall Dock'];
  }

  boxen::osx_defaults { 'Remove all the pinned icons':
    user   => $::boxen_user,
    domain => 'com.apple.dock',
    key    => 'persistent-apps',
    value  => '()',
    notify => Exec['killall Dock'];
  }
}
