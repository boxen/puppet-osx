Puppet::Type.type(:osx_chsh).provide(:dscl) do
  desc "dscl support"

  commands :dscl => '/usr/bin/dscl'

  def shell
    @cached_shell ||= Proc.new {
      output = dscl('.', '-read', "/Users/#{resource[:name]}", 'UserShell')
      output.split(':').last.strip
    }.call
  end

  def shell=(value)
    dscl '.', '-change', "/Users/#{resource[:name]}", 'UserShell', self.shell, resource[:shell]
  end
end
