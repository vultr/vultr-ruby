# VultRuby::AttachBaremetalsVpc2Request

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vpc_id** | **String** | The [VPC ID](#operation/list-vpc2) to attach to this Bare Metal Instance. | [optional] |
| **ip_address** | **String** | The IP address to use for this instance on the attached VPC 2.0 network.   | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::AttachBaremetalsVpc2Request.new(
  vpc_id: null,
  ip_address: null
)
```

