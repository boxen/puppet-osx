# Internal: Restart the Menubar aka the SystemUIServer when necessary.
#
# Example
#
#   boxen::osx_defaults { 'Do a thing':
#     # ... other stuff here ...
#     notify => Exec['killall SystemUIServer'];
#   }
class osx::menubar {
  exec { 'killall SystemUIServer':
    refreshonly => true
  }
}
