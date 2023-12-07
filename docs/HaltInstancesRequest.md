# VultrRuby::HaltInstancesRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_ids** | **Array&lt;String&gt;** | The [Instance IDs](#operation/list-instances) to halt. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::HaltInstancesRequest.new(
  instance_ids: null
)
```

