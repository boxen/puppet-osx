# Public: Add a recovery message to the OS X Lock Screen
#
# Examples
#
#   osx::recovery_message { 'If this Mac is found, please call 123-123-1234': }
define osx::recovery_message(
  $ensure = 'present',
  $value  = $name,
) {
  $kextdir     = '/System/Library/Extensions'
  $eficachedir = '/System/Library/Caches/com.apple.corestorage/EFILoginLocalizations'

  # The recovery message cannot contain an apostrophe (') because we're passing
  # it into a single-quoted exec. If it does contain an apostrophe, fail and
  # alert the user
  if '\'' in $value {
    fail('Your osx::recovery_message declaration contains an apostrophe (\'),',
      'which will cause the exec used to set the message to fail. Please',
      "remove the apostrophe and try again. Your message: \"${value}\"")
  }

  # The CoreStorage kext cache needs to be updated so the recovery message
  # is displayed on the FDE pre-boot screen.
  #
  # The CS cache can be updated directly by touching $eficachedir, if it exists.
  # Otherwise you will need to touch $kextdir to generate it.
  exec { 'Refresh system kext cache':
      command     => "/usr/bin/touch ${kextdir}",
      creates     => $eficachedir,
      refreshonly => true,
      user        => root
  }

  exec { 'Refresh CoreStorage EFI Cache':
      command     => "/usr/bin/touch ${eficachedir}",
      onlyif      => "test -d ${eficachedir}",
      refreshonly => true,
      user        => root
  }

  if $ensure == 'present' {
    if $value != undef {
      boxen::osx_defaults { 'Set OS X Recovery Message':
        ensure => present,
        domain => '/Library/Preferences/com.apple.loginwindow.plist',
        key    => 'LoginwindowText',
        value  => $value,
        notify => [
          Exec['Refresh system kext cache'],
          Exec['Refresh CoreStorage EFI Cache']
        ]
      }

      exec { 'Set OS X Recovery Message NVRAM Variable':
        command => "nvram good-samaritan-message='${value}'",
        unless  => "nvram good-samaritan-message | awk -F'\t' '{ print \$2 }' | grep '^${value}$'",
        user    => root
      }
    } else {
      fail('Cannot set an OS X recovery message without a value')
    }
  } else {
    boxen::osx_defaults { 'Remove OS X Recovery Message':
      ensure => absent,
      domain => '/Library/Preferences/com.apple.loginwindow.plist',
      key    => 'LoginwindowText',
      notify => [
        Exec['Refresh system kext cache'],
        Exec['Refresh CoreStorage EFI Cache']
      ]
    }

    exec { 'Remove OS X Recovery Message NVRAM Variable':
      command => 'nvram -d good-samaritan-message',
      onlyif  => 'nvram -p | grep good-samaritan-message',
      user    => root
    }
  }
}
