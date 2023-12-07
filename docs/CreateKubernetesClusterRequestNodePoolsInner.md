# VultrRuby::CreateKubernetesClusterRequestNodePoolsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **node_quantity** | **Integer** | Number of instances to deploy in this nodepool. Minimum of 1 node required, but at least 3 is recommended. |  |
| **label** | **String** | Label for this nodepool. You cannot change the label after a nodepool is created. You cannot have duplicate node pool labels in the same cluster. |  |
| **plan** | **String** | Plan you want this nodepool to use. Note: minimum plan must be $10 |  |
| **tag** | **String** | Tag for node pool | [optional] |
| **auto_scaler** | **Boolean** | Option to use the auto scaler with your cluster. Default false. | [optional] |
| **min_nodes** | **Integer** | Auto scaler field for minimum nodes you want for your cluster. Default 1. | [optional] |
| **max_nodes** | **Integer** | Auto scaler field for maximum nodes you want for your cluster. Default 1. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::CreateKubernetesClusterRequestNodePoolsInner.new(
  node_quantity: null,
  label: null,
  plan: null,
  tag: null,
  auto_scaler: null,
  min_nodes: null,
  max_nodes: null
)
```

