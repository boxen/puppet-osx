
class osx::disable_app_quarantine {
  boxen::osx_defaults { 'Disable the downloaded app quarantine':
    user   => $::boxen_user,
    key    => 'LSQuarantine',
    domain => 'com.apple.LaunchServices',
    value  => false;
  }
}
