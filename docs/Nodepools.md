# VultRuby::Nodepools

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The [NodePool ID](#operation/get-nodepools). | [optional] |
| **date_created** | **String** | Date of creation | [optional] |
| **label** | **String** | Label for nodepool | [optional] |
| **tag** | **String** | Tag for node pool | [optional] |
| **plan** | **String** | Plan used for nodepool | [optional] |
| **status** | **String** | Status for nodepool | [optional] |
| **node_quantity** | **Integer** | Number of nodes in nodepool | [optional] |
| **nodes** | [**Array&lt;NodepoolInstances&gt;**](NodepoolInstances.md) |  | [optional] |
| **date_updated** | **String** | Date the nodepool was updated. | [optional] |
| **auto_scaler** | **Boolean** | Displays if the auto scaler is enabled or disabled for your cluster. | [optional] |
| **min_nodes** | **Integer** | Auto scaler field that displays the minimum nodes you want for your cluster. | [optional] |
| **max_nodes** | **Integer** | Auto scaler field that displays the maximum nodes you want for your cluster. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::Nodepools.new(
  id: null,
  date_created: null,
  label: null,
  tag: null,
  plan: null,
  status: null,
  node_quantity: null,
  nodes: null,
  date_updated: null,
  auto_scaler: null,
  min_nodes: null,
  max_nodes: null
)
```

