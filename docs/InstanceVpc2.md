# VultrRuby::InstanceVpc2

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the VPC. |  |
| **mac_address** | **String** | The MAC address to use for this instance on the attached VPC 2.0 network. | [optional] |
| **ip_address** | **String** | The IP address to use for this instance on the attached VPC 2.0 network. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::InstanceVpc2.new(
  id: null,
  mac_address: null,
  ip_address: null
)
```

