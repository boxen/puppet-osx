# Public: Dims the dock icons for apps that are hidden.
class osx::dock::dim_hidden_apps {
  include osx::dock

  boxen::osx_defaults { 'Dim hidden apps':
    user   => $::boxen_user,
    domain => 'com.apple.dock',
    key    => 'showhidden',
    value  => true,
    notify => Exec['killall Dock'];
  }
}
