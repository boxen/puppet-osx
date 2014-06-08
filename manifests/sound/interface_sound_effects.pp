# Public: Manages interface sound effects
class osx::sound::interface_sound_effects (
  $enable = true
) {

  $value = $enable ? {
    false   => 0,
    default => 1
  }

  boxen::osx_defaults { 'Manage interface sound effects':
    user      => $::boxen_user,
    key       => 'com.apple.sound.uiaudio.enabled',
    domain    => 'com.apple.systemsound',
    value     => $value,
  }
}
