# Public: Sets the repeat rate for held keys.
#
# rate - the delay between key 'presses'. Defaults to 0.
#
# Examples
#
#   # set the repeat rate to 0 (the default)...
#   include osx::global::key_repeat_rate
#
#   # ...or pick your own repeat rate!
#   class { 'osx::global::key_repeat_rate':
#     rate => 2
#   }
class osx::global::key_repeat_rate($rate = 0) {
  boxen::osx_defaults { 'key repeat rate':
    domain => 'NSGlobalDomain',
    key    => 'KeyRepeat',
    value  => $rate,
    user   => $::boxen_user;
  }
}
