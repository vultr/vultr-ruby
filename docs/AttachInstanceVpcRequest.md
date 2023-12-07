# VultrRuby::AttachInstanceVpcRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vpc_id** | **String** | The [VPC ID](#operation/list-vpcs) to attach to this Instance. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::AttachInstanceVpcRequest.new(
  vpc_id: null
)
```

