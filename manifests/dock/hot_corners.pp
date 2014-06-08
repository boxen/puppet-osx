# Public: Define actions for hot corners
#
# Parameters
#
#  The available actions are: ['Mission Control'|'Application Windows'|'Desktop'|'Start Screen Saver'|'Disable Screen Saver'|'Dashboard'|'Put Display to Sleep'|'Launchpad'|'Notification Center']
#
#  top_left: Action for the top left corner
#  top_right: Action for the top right corner
#  bottom_left: Action for the bottom left corner
#  bottom_right: Action for the bottom right corner
#
# Examples
#
#   class { 'osx::dock::hot_corners':
#     top_left => 'Desktop'
#     top_right => 'Application Windows'
#     bottom_right => 'Dashboard'
#   }
#
class osx::dock::hot_corners (
  $top_left = undef,
  $top_right = undef,
  $bottom_left = undef,
  $bottom_right = undef
) {
  if ($top_left) {
    osx::dock::hot_corner { 'Top Left':
      action => $top_left
    }
  }

  if ($top_right) {
    osx::dock::hot_corner { 'Top Right':
      action => $top_right
    }
  }

  if ($bottom_left) {
    osx::dock::hot_corner { 'Bottom Left':
      action => $bottom_left
    }
  }

  if ($bottom_right) {
    osx::dock::hot_corner { 'Bottom Right':
      action => $bottom_right
    }
  }
}
