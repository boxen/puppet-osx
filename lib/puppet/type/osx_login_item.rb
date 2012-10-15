Puppet::Type.newtype(:osx_login_item) do
  @doc = "Manage OSX login items."

  ensurable do
    newvalue :present do
      provider.create
    end

    newvalue :absent do
      provider.destroy
    end

    defaultto :present
  end

  newparam :name do
    desc "The name of the login item."
  end

  newparam :path do
    desc "The path to the application to be run at login."
  end

  newproperty :hidden do
    desc "Should the application be hidden when launched."
    newvalues :true, :false
    defaultto :false
  end
end
