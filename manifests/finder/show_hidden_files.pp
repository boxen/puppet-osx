# Public: Show Hidden Files by default.
class osx::finder::show_hidden_files {
  include osx::finder

  boxen::osx_defaults { 'Show Hidden Files':
    user   => $::boxen_user,
    key    => 'AppleShowAllFiles',
    domain => 'com.apple.finder',
    value  => true,
    notify => Exec['killall Finder'];
  }
}
