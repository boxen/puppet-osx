Puppet::Type.newtype(:osx_chsh) do
  @doc = ""

  newparam :user do
    desc "The user whose shell is to be changed"
    isnamevar
  end

  newproperty :shell do
    desc "The full path to the shell"
  end
end
