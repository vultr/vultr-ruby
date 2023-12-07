# VultRuby::AttachInstanceVpcRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vpc_id** | **String** | The [VPC ID](#operation/list-vpcs) to attach to this Instance. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::AttachInstanceVpcRequest.new(
  vpc_id: null
)
```

