# VultrRuby::DetachInstanceVpc2Request

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vpc_id** | **String** | The [VPC ID](#operation/list-vpc2) to detach from this Instance. |  |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::DetachInstanceVpc2Request.new(
  vpc_id: null
)
```

