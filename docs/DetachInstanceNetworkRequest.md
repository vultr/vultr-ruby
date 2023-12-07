# VultRuby::DetachInstanceNetworkRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **network_id** | **String** | The [Private Network id](#operation/list-networks) to detach from this Instance. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::DetachInstanceNetworkRequest.new(
  network_id: null
)
```

