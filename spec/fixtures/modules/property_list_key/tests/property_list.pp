property_list_key { 'simple':
  ensure => present,
  path => '/tmp/com.puppetlabs.puppet',
  key    => 'simple',
  value  => 'value',
}

property_list_key { 'boolean':
  ensure     => present,
  path       => '/tmp/com.puppetlabs.puppet',
  key        => 'boolean',
  value      => false,
  value_type => 'boolean',
}

property_list_key { 'hashtest':
  ensure     => present,
  path       => '/tmp/com.puppetlabs.puppet',
  key        => 'hashtest',
  value      => { 'key' => 'value' },
  value_type => 'hash'
}

property_list_key { 'arraytest':
  ensure     => present,
  path     => '/tmp/com.puppetlabs.puppet',
  key        => 'arraytest',
  value      => ['array', 'values'],
  value_type => 'array',
}

  property_list_key { 'array_of_dicts':
  ensure     => present,
  path     => '/tmp/com.puppetlabs.puppet',
  key        => 'array_of_dicts',
  value      => [ {
                    'array'  => 'of',
                    'values' => 'dicts' }],
  value_type => 'array',
}

property_list_key { 'integertest':
  ensure     => present,
  path     => '/tmp/com.puppetlabs.puppet',
  key        => 'integertest',
  value      => 1,
  value_type => 'integer',
}

