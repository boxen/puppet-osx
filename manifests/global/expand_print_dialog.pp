
class osx::global::expand_print_dialog {
  boxen::osx_defaults { 'Expand print panel by default':
    user   => $::luser,
    key    => 'PMPrintingExpandedStateForPrint',
    domain => 'NSGlobalDomain',
    value  => true;
  }
}
