# VultRuby::CreateNetworkRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **region** | **String** | Create the Private Network in this [Region id](#operation/list-regions). |  |
| **description** | **String** | A description of the private network. | [optional] |
| **v4_subnet** | **String** | The IPv4 network address. For example: 10.99.0.0 | [optional] |
| **v4_subnet_mask** | **Integer** | The number of bits for the netmask in CIDR notation. Example: 24 | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::CreateNetworkRequest.new(
  region: null,
  description: null,
  v4_subnet: null,
  v4_subnet_mask: null
)
```

