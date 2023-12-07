# VultrRuby::Loadbalancer

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the Load Balancer. | [optional] |
| **date_created** | **String** | Date this Load Balancer was created. | [optional] |
| **region** | **String** | The [Region id](#operation/list-regions) where the Load Balancer is located. | [optional] |
| **label** | **String** | The user-supplied label for this load-balancer. | [optional] |
| **status** | **String** | The current status.  * active | [optional] |
| **ipv4** | **String** | The IPv4 address of this Load Balancer. | [optional] |
| **ipv6** | **String** | The IPv6 address of this Load Balancer. | [optional] |
| **generic_info** | [**LoadbalancerGenericInfo**](LoadbalancerGenericInfo.md) |  | [optional] |
| **health_check** | [**LoadbalancerHealthCheck**](LoadbalancerHealthCheck.md) |  | [optional] |
| **has_ssl** | **Boolean** | Indicates if this Load Balancer has an SSL certificate installed. | [optional] |
| **http2** | **Boolean** | Indicates if this Load Balancer has HTTP2 enabled. | [optional] |
| **nodes** | **Integer** | The number of nodes to add to the load balancer (1-99), must be an odd number. This defaults to 1. | [optional] |
| **forward_rules** | [**Array&lt;LoadbalancerForwardRulesInner&gt;**](LoadbalancerForwardRulesInner.md) | An array of forwarding rule objects. | [optional] |
| **instances** | **Array&lt;String&gt;** | Array of [Instance ids](#operation/list-instances) attached to this Load Balancer. | [optional] |
| **firewall_rules** | [**Array&lt;LoadbalancerFirewallRulesInner&gt;**](LoadbalancerFirewallRulesInner.md) | An array of firewall rule objects. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::Loadbalancer.new(
  id: null,
  date_created: null,
  region: null,
  label: null,
  status: null,
  ipv4: null,
  ipv6: null,
  generic_info: null,
  health_check: null,
  has_ssl: null,
  http2: null,
  nodes: null,
  forward_rules: null,
  instances: null,
  firewall_rules: null
)
```

