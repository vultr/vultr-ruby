# VultrRuby::AttachInstanceNetworkRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **network_id** | **String** | The [Private Network id](#operation/list-networks) to attach to this Instance. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::AttachInstanceNetworkRequest.new(
  network_id: null
)
```

