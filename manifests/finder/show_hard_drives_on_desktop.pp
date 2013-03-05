
class osx::finder::show_hard_drives_on_desktop {
  include osx::finder

  boxen::osx_defaults { 'Show internal drives on the desktop':
    user   => $::luser,
    domain => 'com.apple.finder',
    key    => 'ShowHardDrivesOnDesktop',
    value  => true,
    notify => Exec['killall Finder'];
  }
}
