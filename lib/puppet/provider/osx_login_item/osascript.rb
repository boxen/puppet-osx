Puppet::Type.type(:osx_login_item).provide(:osascript) do
  def create
    props = [
      "{",
      "name:\"#{resource[:name]}\",",
      "path:\"#{resource[:path]}\",",
      "hidden:#{resource[:hidden].to_s}",
      "}",
    ].join

    run_script <<-EOF
      tell application "System Events" to make login item at end with
      properties #{props}
    EOF
  end

  def destroy
    run_script <<-EOF
      tell application "System Events" to delete (the first login item whose
      name is equal to "#{resource[:name]}")
    EOF
  end

  def exists?
    output = run_script <<-EOF
      tell application "System Events" to get the name of every login item
    EOF

    output.strip.split(', ').include? resource[:name]
  end

  def hidden
    get_property_value('hidden')
  end

  def hidden=(value)
    set_property_value('hidden', value)
  end

private
  def get_property_value(property)
    output = run_script <<-EOF
      tell application "System Events" to get #{property} of the first login
      item whose name is equal to "#{resource[:name]}"
    EOF
    output.strip
  end

  def set_property_value(property, value)
    run_script <<-EOF
      tell application "System Events" to set #{property} of (the first login
      item whose name is equal to "#{resource[:name]}") to #{value}
    EOF
  end

  def run_script(script)
    %x{/usr/bin/osascript -e '#{script.gsub(/\n/, ' ').squeeze(' ').strip}'}
  end
end
