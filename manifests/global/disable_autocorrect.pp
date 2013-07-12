# Public: Disables spelling autocorrect.
class osx::global::disable_autocorrect {
  boxen::osx_defaults { 'Disable autocorrect':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'NSAutomaticSpellingCorrectionEnabled',
    value  => false,
    user   => $::boxen_user;
  }
}
