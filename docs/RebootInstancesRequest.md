# VultrRuby::RebootInstancesRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_ids** | **Array&lt;String&gt;** | The [Instance IDs](#operation/list-instances) to reboot. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::RebootInstancesRequest.new(
  instance_ids: null
)
```

