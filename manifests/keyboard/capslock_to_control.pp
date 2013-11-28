# Public: Remaps capslock to control on attached keyboards.
#
# Example
#
#   include osx::keyboard::capslock_to_control
#
class osx::keyboard::capslock_to_control {
  # Remap capslock to control on all attached keyboards
  $keyboard_ids = 'ioreg -n IOHIDKeyboard -r | grep -E \'VendorID"|ProductID\' | awk \'{ print $4 }\' | paste -s -d\'-\n\' -'
  $check = 'xargs -I{} sh -c \'defaults -currentHost read -g "com.apple.keyboard.modifiermapping.{}-0" | grep "Dst = 2" > /dev/null\''
  $remap = 'xargs -I{} defaults -currentHost write -g "com.apple.keyboard.modifiermapping.{}-0" -array "<dict><key>HIDKeyboardModifierMappingDst</key><integer>2</integer><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer></dict>"'
  exec { 'Remap capslock to control on all keyboards':
    command => "${keyboard_ids} | ${remap}",
    unless => "${keyboard_ids} | ${check}"
  }
}
