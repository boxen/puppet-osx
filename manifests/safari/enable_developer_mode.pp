# Public: Enables developer mode in Safari
#
# Examples
#
#   include osx::safari::enable_developer_mode
#
class osx::safari::enable_developer_mode {
  boxen::osx_defaults { 'enable developer mode':
    ensure => present,
    domain => 'com.apple.Safari',
    key    => 'IncludeDevelopMenu',
    type   => 'bool',
    value  => true,
    user   => $::boxen_user
  }
}
