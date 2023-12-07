# VultrRuby::ListLoadBalancers200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **load_balancers** | [**Array&lt;Loadbalancer&gt;**](Loadbalancer.md) |  | [optional] |
| **meta** | [**Meta**](Meta.md) |  | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::ListLoadBalancers200Response.new(
  load_balancers: null,
  meta: null
)
```

