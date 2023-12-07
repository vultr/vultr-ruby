# VultrRuby::ListLoadBalancerForwardingRules200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **forwarding_rules** | [**Array&lt;ForwardingRule&gt;**](ForwardingRule.md) |  | [optional] |
| **meta** | [**Meta**](Meta.md) |  | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::ListLoadBalancerForwardingRules200Response.new(
  forwarding_rules: null,
  meta: null
)
```

