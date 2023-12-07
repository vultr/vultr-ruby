# VultRuby::StartInstancesRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_ids** | **Array&lt;String&gt;** | The [Instance IDs](#operation/list-instances) to start. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::StartInstancesRequest.new(
  instance_ids: null
)
```

