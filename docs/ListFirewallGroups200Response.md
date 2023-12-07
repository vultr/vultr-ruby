# VultrRuby::ListFirewallGroups200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **firewall_groups** | [**Array&lt;FirewallGroup&gt;**](FirewallGroup.md) |  | [optional] |
| **meta** | [**Meta**](Meta.md) |  | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::ListFirewallGroups200Response.new(
  firewall_groups: null,
  meta: null
)
```

