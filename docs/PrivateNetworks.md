# VultrRuby::PrivateNetworks

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the Private Network. | [optional] |
| **mac_address** | **String** | The assigned MAC address. | [optional] |
| **ip_address** | **String** | The assigned IP address. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::PrivateNetworks.new(
  id: null,
  mac_address: null,
  ip_address: null
)
```

