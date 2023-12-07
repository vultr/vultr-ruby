# VultrRuby::UpdateNodepoolRequest1

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **node_quantity** | **Integer** | Number of instances in the nodepool. Minimum of 1 is required, but at least 3 is recommended. |  |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::UpdateNodepoolRequest1.new(
  node_quantity: null
)
```

