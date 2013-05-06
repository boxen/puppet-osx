require 'rexml/document'

Puppet::Type.type(:osx_spotlight_exclude).provide(:plistbuddy) do
  commands :plutil     => 'plutil',
           :plistbuddy => '/usr/libexec/PlistBuddy'

  FILE = '/.Spotlight-V100/VolumeConfiguration.plist'

  def create
    @property_hash = {
      :name   => @resource[:name],
      :ensure => :present,
    }
    plistbuddy '-c', "Add Exclusions: string '#{@property_hash[:name]}'", FILE
  end

  def destroy
    plistbuddy '-c', "Delete Exclusions:#{@property_hash[:index]}", FILE
    @property_hash.clear
  end

  def exists?
    !(@property_hash[:ensure] == :absent or @property_hash.empty?)
  end

  def self.instances
    xml = plutil '-convert', 'xml1', '-o', '/dev/stdout', FILE
    doc = REXML::Document.new(xml).root

    instances = []
    index = 0

    doc.elements['//key[.="Exclusions"]'].next_element.each_element('string') do |e|
      instances << new({
        :name     => e.text,
        :index    => index,
        :ensure   => :present,
        :provider => self.name,
      })
      index += 1
    end
    instances
  end

  def self.prefetch(resources)
    instances.each do |provider|
      if resource = resources[provider.name.to_s]
        resource.provider = provider
      end
    end
  end
end
