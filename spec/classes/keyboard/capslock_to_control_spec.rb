require 'spec_helper'

describe 'osx::keyboard::capslock_to_control' do
  let(:command_str) do
    "ioreg -n IOHIDKeyboard -r | grep -E 'VendorID\"|ProductID' | " \
    "awk '{ print $4 }' | paste -s -d'-\\n' - | xargs -I{} defaults " \
    "-currentHost write -g \"com.apple.keyboard.modifiermapping.{}-0\" " \
    "-array \"<dict><key>HIDKeyboardModifierMappingDst</key>" \
    "<integer>2</integer><key>HIDKeyboardModifierMappingSrc</key>" \
    "<integer>0</integer></dict>\""
  end

  let(:unless_str) do
    "ioreg -n IOHIDKeyboard -r | grep -E 'VendorID\"|ProductID' | " \
    "awk '{ print $4 }' | paste -s -d'-\\n' - | xargs -I{} sh -c 'defaults" \
    " -currentHost read -g \"com.apple.keyboard.modifiermapping.{}-0\" | " \
    "grep \"Dst = 2\" > /dev/null'"
  end

  it do
    should contain_exec('Remap capslock to control on all keyboards').
      with(:command => command_str, :unless => unless_str)
  end

end
