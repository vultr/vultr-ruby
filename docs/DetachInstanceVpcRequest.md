# VultRuby::DetachInstanceVpcRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vpc_id** | **String** | The [VPC ID](#operation/list-vpcs) to detach from this Instance. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::DetachInstanceVpcRequest.new(
  vpc_id: null
)
```

