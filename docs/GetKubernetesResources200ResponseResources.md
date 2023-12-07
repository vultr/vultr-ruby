# VultrRuby::GetKubernetesResources200ResponseResources

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **block_storage** | [**Array&lt;GetKubernetesResources200ResponseResourcesBlockStorageInner&gt;**](GetKubernetesResources200ResponseResourcesBlockStorageInner.md) |  | [optional] |
| **load_balancer** | [**Array&lt;GetKubernetesResources200ResponseResourcesLoadBalancerInner&gt;**](GetKubernetesResources200ResponseResourcesLoadBalancerInner.md) |  | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::GetKubernetesResources200ResponseResources.new(
  block_storage: null,
  load_balancer: null
)
```

