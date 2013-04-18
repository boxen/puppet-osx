# Public: Expands Print panel by default.
class osx::global::expand_print_dialog {
  boxen::osx_defaults { 'Expand print panel by default':
    user   => $::boxen_user,
    key    => 'PMPrintingExpandedStateForPrint',
    domain => 'NSGlobalDomain',
    value  => true;
  }
}
