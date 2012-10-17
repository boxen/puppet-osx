define osx::recovery_message(
  $ensure = 'present',
  $domain = undef,
  $key    = undef,
  $value  = undef,
  $user   = undef,
) {
  if $ensure == 'present' {
    if $value != undef {
      property_list_key { 'Set OS X Recovery Message':
        ensure => present,
        path   => '/Library/Preferences/com.apple.loginwindow.plist',
        key    => 'LoginwindowText',
        value  => $value
      }
    } else {
      warning('Cannot set an OS X recovery message without a value')
    }
  } else {
    property_list_key { 'Remove OS X Recovery Message':
      ensure => absent,
      path   => '/Library/Preferences/com.apple.loginwindow.plist',
      key    => 'LoginwindowText'
    }
  }
}
