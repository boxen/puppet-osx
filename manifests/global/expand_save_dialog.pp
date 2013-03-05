
class osx::global::expand_save_dialog {
  boxen::osx_defaults { 'Expand save panel by default':
    user   => $::luser,
    key    => 'NSNavPanelExpandedStateForSaveMode',
    domain => 'NSGlobalDomain',
    value  => true;
  }
}
