# VultrRuby::DetachBaremetalVpc2Request

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vpc_id** | **String** | The [VPC ID](#operation/list-vpc2) to detach from this Bare Metal Instance. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::DetachBaremetalVpc2Request.new(
  vpc_id: null
)
```

