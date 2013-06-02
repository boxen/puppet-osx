Puppet::Type.newtype(:osx_spotlight_exclude) do
  @doc = <<-EOF.strip
    A type for managing directories that should be excluded from the Spotlight
    index.

    osx_spotlight_exclude { '/home/myuser/.vagrant': }
  EOF

  ensurable do
    desc <<-EOF.strip
      The desired state of the Spotlight exclusion.
    EOF

    newvalue(:present) do
      provider.create
    end

    newvalue(:absent) do
      provider.destroy
    end

    defaultto :present
  end

  newparam(:path) do
    desc <<-EOF.strip
      The path to exclude from Spotlight indexing.
    EOF

    isnamevar
  end

  newparam(:index) do
    desc <<-EOF.strip
      A read-only parameter set by Puppet. Manually specifying this value may
      cause bad things to happen to your machine.
    EOF
  end
end
