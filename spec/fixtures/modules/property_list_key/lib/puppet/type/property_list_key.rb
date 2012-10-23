require 'pathname'
Puppet::Type.newtype(:property_list_key) do
  desc "A Puppet type to model property list files"

  ensurable

  newparam(:key) do
    desc "The name of the key for which we're ensuring absent/present"
  end

  newproperty(:value, :array_matching => :all) do
    desc "The value of the specified key"

    # Overwriting the insync? method to handle how Puppet string-ifies
    # all passed values. When you deal with things like Boolean values,
    # it's a giant pain to make sure they're in sync with passed string
    # values (especially when Puppet pulls in Should values as
    # A DAMN ARRAY).
    def insync?(is)
      case resource[:value_type]
      when :boolean
        case should.first
        when 'true', true
          [true, 'true'].include?(is.to_s) ? true : false
        when 'false', false
          [false, 'false'].include?(is.to_s) ? true : false
        end
      when :hash, :string
        should.first == is ? true : false
      when :integer
        should.first.to_i == is ? true : false
      else
        super
      end
    end
  end

  newparam(:path) do
    desc "The path of the plist file"

    validate do |value|
      path = Pathname.new(value)
      unless path.absolute?
        raise Puppet::Error, "Path must be absolute: #{value}"
      end
    end
  end

  newparam(:value_type) do
    desc "The value type for the plist key's value"

    newvalues('string', 'boolean', 'array', 'hash', 'integer')
    defaultto 'string'
  end

  newparam(:name, :namevar => true) do
    desc "Arbitrary namevar"
  end
end
