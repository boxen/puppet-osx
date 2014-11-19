# Public: Show warning before changing an extension.
class osx::finder::show_warning_before_changing_an_extension {
  include osx::finder

  boxen::osx_defaults { 'Show warning before changing an extension':
    user   => $::boxen_user,
    key    => 'FXEnableExtensionChangeWarning',
    domain => 'com.apple.finder',
    value  => true,
    notify => Exec['killall Finder'];
  }
}
