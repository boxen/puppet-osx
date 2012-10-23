require 'puppet'
require 'puppet/type/property_list_key'
describe Puppet::Type.type(:property_list_key) do
  let(:resource) {
    Puppet::Type.type(:property_list_key).new(
                                    :name       => 'simple_string',
                                    :path       => '/tmp/com.puppetlabs.puppet.plist',
                                    :key        => 'simple',
                                    :value      => 'value',
                                    :value_type => 'string'
                                   )
  }

  it 'is ensurable' do
    resource[:ensure] = :present
    resource[:ensure].should == :present
    resource[:ensure] = :absent
    resource[:ensure].should == :absent
  end

  it 'raises an error if an invalid ensure value is passed' do
    expect { resource[:ensure] = 'file' }.to raise_error \
      Puppet::Error, /Parameter ensure failed: Invalid value "file"/
  end

  it 'accepts a valid path value' do
    resource[:path] = '/path/to/foo.plist'
    resource[:path].should == '/path/to/foo.plist'
  end

  it 'raises an error if an absolute path is not passed' do
    expect { resource[:path] = 'foo' }.to raise_error Puppet::Error,
      /Parameter path failed: Path must be absolute:/
  end

  %w{ string boolean integer hash array }.each do |value|
    it "accepts #{value} as a valid value_type" do
        resource[:value_type] = value
        resource[:value_type].should == value.intern
    end
  end

  it 'raises an error if an invalid value_type is passed' do
    expect { resource[:value_type] = 'blargh' }.to raise_error \
      Puppet::Error, /Parameter value_type failed: Invalid value "blargh"/
  end
end
