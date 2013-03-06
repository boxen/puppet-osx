
class osx::finder::unhide_library {
  $home = "/Users/$::boxen_user"

  exec { 'Unhide ~/Library':
    command => "chflags nohidden $home/Library",
    onlyif  => "ls -Ol $home | grep Library | grep hidden";
  }
}
