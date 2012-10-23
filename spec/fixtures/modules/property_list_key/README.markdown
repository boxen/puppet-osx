##property_list_key

This is a Puppet module that will manage OS X plist files

License
-------
Apache 2

Contact
-------
Gary Larizza <gary@puppetlabs.com>

Support
-------
None as of right now.  Good luck!

Usage
-------
        property_list_key { 'test3':
          ensure     => present,
          path       => '/tmp/com.puppetlabs.puppet',
          key        => 'arraytest',
          value      => ['array', 'values'],
          value_type => 'array',
        }

Comments
--------

As of right now, this module has no tests for the provider - it should
be considered experimental and beta code.
