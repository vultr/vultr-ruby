# VultrRuby::StartInstancesRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_ids** | **Array&lt;String&gt;** | The [Instance IDs](#operation/list-instances) to start. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::StartInstancesRequest.new(
  instance_ids: null
)
```

