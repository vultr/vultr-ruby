# VultrRuby::ListFirewallGroupRules200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **firewall_rules** | [**Array&lt;FirewallRule&gt;**](FirewallRule.md) |  | [optional] |
| **meta** | [**Meta**](Meta.md) |  | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::ListFirewallGroupRules200Response.new(
  firewall_rules: null,
  meta: null
)
```

