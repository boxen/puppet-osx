
class osx::finder::unhide_library {
  exec {
    'Unhide ~/Library':
      command => "chflags nohidden $home/Library";
  }
}
