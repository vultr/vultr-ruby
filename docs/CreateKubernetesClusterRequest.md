# VultRuby::CreateKubernetesClusterRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **label** | **String** | The label for your Kubernetes cluster. | [optional] |
| **region** | **String** | Region you want to deploy VKE in. See [Regions](#tag/region) for more information. |  |
| **version** | **String** | Version of Kubernetes you want to deploy. |  |
| **ha_controlplanes** | **Boolean** | Whether a highly available control planes configuration should be deployed * true * false (default) | [optional] |
| **enable_firewall** | **Boolean** | Whether a [Firewall Group](#tag/firewall) should be deployed and managed by this cluster * true * false (default) | [optional] |
| **node_pools** | [**Array&lt;CreateKubernetesClusterRequestNodePoolsInner&gt;**](CreateKubernetesClusterRequestNodePoolsInner.md) |  | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::CreateKubernetesClusterRequest.new(
  label: null,
  region: null,
  version: null,
  ha_controlplanes: null,
  enable_firewall: null,
  node_pools: null
)
```

