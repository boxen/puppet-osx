# Public: Install updates from Apple
class osx::software_update {
  exec {
    'OSX Software Update':
      command => 'softwareupdate -i -a',
      user    => 'root',
      timeout => 0
  }
}
