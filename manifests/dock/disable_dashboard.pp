# Public: Disable the dashboard
class osx::dock::disable_dashboard {
  include osx::dock

  boxen::osx_defaults { 'Disable the dashboard':
    user   => $::boxen_user,
    key    => 'mcx-disabled',
    domain => 'com.apple.dashboard',
    value  => true,
    notify => Exec['killall Dock'];
  }
}
