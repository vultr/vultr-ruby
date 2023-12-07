# VultrRuby::GetInstanceNeighbors200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **neighbors** | **Array&lt;String&gt;** | An array of [Instance ids](#operation/list-instances) in the same location as this Instance. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::GetInstanceNeighbors200Response.new(
  neighbors: null
)
```

