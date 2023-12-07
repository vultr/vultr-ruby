# VultrRuby::DetachInstanceNetworkRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **network_id** | **String** | The [Private Network id](#operation/list-networks) to detach from this Instance. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::DetachInstanceNetworkRequest.new(
  network_id: null
)
```

