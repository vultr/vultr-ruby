# VultRuby::HaltInstancesRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_ids** | **Array&lt;String&gt;** | The [Instance IDs](#operation/list-instances) to halt. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::HaltInstancesRequest.new(
  instance_ids: null
)
```

