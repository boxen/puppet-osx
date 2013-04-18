# Public: Show removable media on the desktop.
class osx::finder::show_removable_media_on_desktop {
  include osx::finder

  boxen::osx_defaults { 'Show mounted media on the desktop':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'ShowRemovableMediaOnDesktop',
    value  => true,
    notify => Exec['killall Finder'];
  }
}
