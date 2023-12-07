# VultRuby::UpdateNodepoolRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **node_quantity** | **Integer** | Number of instances in the NodePool. Minimum of 1 is required, but at least 3 is recommended. | [optional] |
| **tag** | **String** | Tag for your node pool | [optional] |
| **auto_scaler** | **Boolean** | Option to use the auto scaler for your cluster. Default false. | [optional] |
| **min_nodes** | **Integer** | Auto scaler field for minimum nodes you want for your cluster. Default 1. | [optional] |
| **max_nodes** | **Integer** | Auto scaler field for maximum nodes you want for your cluster. Default 1. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::UpdateNodepoolRequest.new(
  node_quantity: null,
  tag: null,
  auto_scaler: null,
  min_nodes: null,
  max_nodes: null
)
```

