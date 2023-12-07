# VultRuby::Network

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the Private Network. |  |
| **region** | **String** | The [Region id](#operation/list-regions) where the network is located. | [optional] |
| **date_created** | **String** | Date the network was created. | [optional] |
| **description** | **String** | A description of the private network. | [optional] |
| **v4_subnet** | **String** | The IPv4 network address. For example: 10.99.0.0 | [optional] |
| **v4_subnet_mask** | **Integer** | The number of bits for the netmask in CIDR notation. Example: 24 | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::Network.new(
  id: null,
  region: null,
  date_created: null,
  description: null,
  v4_subnet: null,
  v4_subnet_mask: null
)
```

