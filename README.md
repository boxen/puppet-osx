# OSX Defaults Module for Puppet

[![Build Status](https://travis-ci.org/boxen/puppet-osx.png?branch=master)](https://travis-ci.org/boxen/puppet-osx)

Provides classes for setting various defaults in Mac OS X. Also provides a means
to set a "recovery message" to be displayed on the login and lock screens.

## Recovery Message Usage

Displays the given message on the lock and login screens.

```puppet
osx::recovery_message { 'If this Mac is found, please call 123-456-7890': }
```

## One-Shot Settings

Just `include` any of these in your manifest.

### Global Settings

* `osx::global::disable_key_press_and_hold` - disable press-and-hold for
  accented character entry
* `osx::global::enable_keyboard_control_access` - enables the keyboard for
  navigating controls in dialogs
* `osx::global::expand_print_dialog` - expand the print dialog by default
* `osx::global::expand_save_dialog` - expand the save dialog by default
* `osx::global::disable_remote_control_ir_receiver` - disable remote control infrared receiver
* `osx::global::disable_autocorrect` - disables spelling autocorrection

### Dock Settings

* `osx::dock::2d` - use the old flat dock style
* `osx::dock::autohide` - automatically hide the dock
* `osx::dock::clear_dock` - ensures the dock only contains apps that are running
* `osx::dock::disable` - disable the dock by setting a long autohide-delay
* `osx::dock::dim_hidden_apps` - dims icons of hidden apps
* `osx::dock::hide_indicator_lights` - remove the indicator lights below running
  apps

### Finder Settings

* `osx::finder::show_external_hard_drives_on_desktop`
* `osx::finder::show_hard_drives_on_desktop`
* `osx::finder::show_mounted_servers_on_desktop`
* `osx::finder::show_removable_media_on_desktop`
* `osx::finder::show_all_on_desktop` - does all of the above
* `osx::finder::empty_trash_securely` - enable Secure Empty Trash
* `osx::finder::unhide_library` - unsets the hidden flag on ~/Library
* `osx::finder::show_hidden_files`

### Universal Access Settings

* `osx::universal_access::ctrl_mod_zoom` - enables zoom by scrolling while
  holding Control
* `osx::universal_access::enable_scrollwheel_zoom` - enables zoom using the
  scroll wheel

### Miscellaneous Settings

* `osx::disable_app_quarantine` - disable the downloaded app quarantine
* `osx::no_network_dsstores` - disable creation of .DS_Store files on network
  shares
* `osx::software_update` - download and install software updates

## Customizable Settings

These settings can be used like one-shots or customized.

`osx::global::key_repeat_delay` - the amount of time (in ms) before a key starts
  repeating

```puppet
# Set the default value (35)
include osx::global::key_repeat_delay

# ... or set your own
class { 'osx::global::key_repeat_delay':
  delay => 10
}
```

`osx::global::key_repeat_rate` - the amount of time (in ms) before key repeat
  'presses'

```puppet
# Set the default value (0)
include osx::global::key_repeat_rate

# ... or set your own
class { 'osx::global::key_repeat_rate':
  rate => 2
}
```

`osx::global::natural_mouse_scrolling` - enable/disable 'natural' mouse scrolling. *Requires re-login for new settings to initialize.*

```puppet
# Set the default value (enabled=true)
include osx::global::natural_mouse_scrolling

# ... or set your own
class { 'osx::global::natural_mouse_scrolling':
  enabled => false
}
```


`osx::universal_access::cursor_size` - the amount the cursor will be zoomed

```puppet
# Set the default value (1.5)
include osx::universal_access::cursor_size

# ... or set your own
class { 'osx::universal_access::cursor_size':
  zoom => 2
}
```

`osx::dock::icon_size` - the size of the dock icons, in pixels

```puppet
# Set the default value (36)
include osx::dock::icon_size

# ... or set your own
class { 'osx::dock::icon_size':
  size => 36
}
```

`osx::dock::position` - the location of the dock on the screen ('right', 'left', 'top', 'bottom')

```puppet
# Set the default value ('right')
include osx::dock::position

# ... or set your own
class { 'osx::dock::position':
  position => 'right'
}
```

`osx::dock::pin_position` - the location to pin the dock to ('start', 'middle', 'end')

```puppet
# Set the default value ('start')
include osx::dock::pin_position

# ... or set your own
class { 'osx::dock::pin_position':
  size => 36
}
```

`osx::mouse::button_mode` - the button mode for multitouch mice (1, 2) *Requires re-login for new settings to initialize.*

```puppet
# Set the default mode (1)
include osx::mouse::button_mode

# ... or set your own
class { 'osx::mouse::button_mode':
  mode => 2
}
```

`osx::mouse::smart_zoom` - enable/disable smart zoom for multitouch mice *Requires re-login for new settings to initialize.*

```puppet
# Set the default value (enabled=false)
include osx::mouse::smart_zoom

# ... or set your own
class { 'osx::mouse::smart_zoom':
  enabled => true
}
```

`osx::mouse::swipe_between_pages` - enable/disable swipe between pages for multitouch mice *Requires re-login for new settings to initialize.*

```puppet
# Set the default value (enabled=false)
include osx::mouse::swipe_between_pages

# ... or set your own
class { 'osx::mouse::swipe_between_pages':
  enabled => true
}
```

## Required Puppet Modules

* boxen

## Developing

Write code.

Run `script/cibuild`.
