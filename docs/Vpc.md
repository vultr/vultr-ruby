# VultrRuby::Vpc

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the VPC. |  |
| **region** | **String** | The [Region id](#operation/list-regions) where the VPC is located. | [optional] |
| **date_created** | **String** | Date the VPC was created. | [optional] |
| **description** | **String** | A description of the VPC. | [optional] |
| **v4_subnet** | **String** | The IPv4 VPC address. For example: 10.99.0.0 | [optional] |
| **v4_subnet_mask** | **Integer** | The number of bits for the netmask in CIDR notation. Example: 24 | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::Vpc.new(
  id: null,
  region: null,
  date_created: null,
  description: null,
  v4_subnet: null,
  v4_subnet_mask: null
)
```

