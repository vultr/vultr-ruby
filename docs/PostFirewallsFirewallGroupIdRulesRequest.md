# VultrRuby::PostFirewallsFirewallGroupIdRulesRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ip_type** | **String** | The type of IP rule.  * v4 * v6 |  |
| **protocol** | **String** | The protocol for this rule.  * ICMP * TCP * UDP * GRE * ESP * AH  |  |
| **subnet** | **String** | IP address representing a subnet. The IP address format must match with the \&quot;ip_type\&quot; parameter value. |  |
| **subnet_size** | **Integer** | The number of bits for the netmask in CIDR notation. Example: 32 |  |
| **port** | **String** | TCP/UDP only. This field can be a specific port or a colon separated port range. | [optional] |
| **source** | **String** | If the source string is given a value of \&quot;cloudflare\&quot; subnet and subnet_size will both be ignored. Possible values:  |   | Value | Description | | - | ------ | ------------- | |   | \&quot;\&quot; | Use the value from &#x60;subnet&#x60; and &#x60;subnet_size&#x60;. | |   | cloudflare | Allow all of Cloudflare&#39;s IP space through the firewall | |   | [Load Balancer id](#operation/list-load-balancers) | Provide a load balancer ID to use its IPs |  | [optional] |
| **notes** | **String** | User-supplied notes for this rule. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::PostFirewallsFirewallGroupIdRulesRequest.new(
  ip_type: null,
  protocol: null,
  subnet: null,
  subnet_size: null,
  port: null,
  source: null,
  notes: null
)
```

