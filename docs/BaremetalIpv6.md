# VultrRuby::BaremetalIpv6

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ip** | **String** | A unique ID for the IPv6 address. | [optional] |
| **network** | **String** | The IPv6 subnet. | [optional] |
| **network_size** | **Integer** | The IPv6 network size in bits. | [optional] |
| **type** | **String** | The type of IP address.  * main_ip | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::BaremetalIpv6.new(
  ip: null,
  network: null,
  network_size: null,
  type: null
)
```

