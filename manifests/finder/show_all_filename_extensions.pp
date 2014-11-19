# Public: Show all filename extensions.
class osx::finder::show_all_filename_extensions {
  include osx::finder

  boxen::osx_defaults { 'Show all filename extensions':
    user   => $::boxen_user,
    key    => 'AppleShowAllExtensions',
    domain => 'com.apple.finder',
    value  => true,
    notify => Exec['killall Finder'];
  }
}
