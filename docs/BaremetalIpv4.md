# VultrRuby::BaremetalIpv4

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ip** | **String** | The IPv4 address. | [optional] |
| **netmask** | **String** | The IPv4 netmask in dot-decimal notation. | [optional] |
| **gateway** | **String** | The gateway IP address. | [optional] |
| **type** | **String** | The type of IP address.  * main_ip | [optional] |
| **reverse** | **String** | The reverse DNS information for this IP address. | [optional] |
| **mac_address** | **String** | The MAC address associated with this IP address. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::BaremetalIpv4.new(
  ip: null,
  netmask: null,
  gateway: null,
  type: null,
  reverse: null,
  mac_address: null
)
```

