# Internal: Restart finder when necessary.
class osx::finder {
  exec { 'killall Finder':
    refreshonly => true
  }
}
