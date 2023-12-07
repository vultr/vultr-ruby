# VultRuby::Vpc2

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the VPC. |  |
| **region** | **String** | The [Region id](#operation/list-regions) where the VPC is located. | [optional] |
| **date_created** | **String** | Date the VPC was created. | [optional] |
| **description** | **String** | A description of the VPC. | [optional] |
| **ip_block** | **String** | The VPC subnet IP address. For example: 10.99.0.0 | [optional] |
| **prefix_length** | **Integer** | The number of bits for the netmask in CIDR notation. Example: 24 | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::Vpc2.new(
  id: null,
  region: null,
  date_created: null,
  description: null,
  ip_block: null,
  prefix_length: null
)
```

