# VultrRuby::FirewallRule

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | A unique ID for the Firewall Rule. | [optional] |
| **type** | **String** | This field is deprecated. Use &#x60;ip_type&#x60; instead.  The type of IP rule.  * v4 * v6 | [optional] |
| **ip_type** | **String** | The type of IP rule.  * v4 * v6 | [optional] |
| **action** | **String** | Action to take when this rule is met.  * accept | [optional] |
| **protocol** | **String** | The protocol for this rule.  * ICMP * TCP * UDP * GRE  | [optional] |
| **port** | **String** | Port or port range for this rule. | [optional] |
| **subnet** | **String** | IP address representing a subnet. The IP address format must match with the \&quot;ip_type\&quot; parameter value. | [optional] |
| **subnet_size** | **Integer** | The number of bits for the netmask in CIDR notation. Example: 24 | [optional] |
| **source** | **String** | If the source string is given a value of \&quot;cloudflare\&quot; subnet and subnet_size will both be ignored. Possible values:  |   | Value | Description | | - | ------ | ------------- | |   | \&quot;\&quot; | Use the value from &#x60;subnet&#x60; and &#x60;subnet_size&#x60;. | |   | cloudflare | Allow all of Cloudflare&#39;s IP space through the firewall | | [optional] |
| **notes** | **String** | User-supplied notes for this rule. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::FirewallRule.new(
  id: null,
  type: null,
  ip_type: null,
  action: null,
  protocol: null,
  port: null,
  subnet: null,
  subnet_size: null,
  source: null,
  notes: null
)
```

