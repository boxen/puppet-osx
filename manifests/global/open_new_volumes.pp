class osx::global::open_new_volumes {
  boxen::osx_defaults { 'Auto Open New Read-Only Volumes':
    ensure => present,
    domain => 'com.apple.frameworks.diskimages',
    key => 'auto-open-ro-root',
    value => true,
    type => bool,
    user => $::boxen_user;
  }

  boxen::osx_defaults { 'Auto Open New Read-Write Volumes':
    ensure => present,
    domain => 'com.apple.frameworks.diskimages',
    key => 'auto-open-rw-root',
    value => true,
    type => bool,
    user => $::boxen_user;
  }

  boxen::osx_defaults { 'Auto Open New Removable Volumes':
    ensure => present,
    domain => 'com.apple.finder',
    key => 'OpenWindowForNewRemovableDisk',
    value => true,
    type => bool,
    user => $::boxen_user;
  }
}
