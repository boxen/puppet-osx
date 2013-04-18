# Public: Removes the dots that indicate a running application.
class osx::dock::hide_indicator_lights {
  include osx::dock

  boxen::osx_defaults { 'Hide indicator lights under running applications':
    user   => $::boxen_user,
    domain => 'com.apple.dock',
    key    => 'show-process-indicators',
    value  => false,
    notify => Exec['killall Dock'];
  }
}
