
class osx::finder {
  exec { 'killall Finder':
    refreshonly => true
  }
}
