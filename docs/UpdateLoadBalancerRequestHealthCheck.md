# VultRuby::UpdateLoadBalancerRequestHealthCheck

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **protocol** | **String** | The protocol to use for health checks.  * HTTPS * HTTP * TCP | [optional] |
| **port** | **Integer** | The port to use for health checks. | [optional] |
| **path** | **String** | HTTP Path to check. Only applies if protocol is HTTP, or HTTPS. | [optional] |
| **check_interval** | **String** | Interval between health checks. | [optional] |
| **response_timeout** | **String** | Timeout before health check fails. | [optional] |
| **unhealthy_threshold** | **String** | Number times a check must fail before becoming unhealthy. | [optional] |
| **healthy_threshold** | **String** | Number of times a check must succeed before returning to healthy status. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::UpdateLoadBalancerRequestHealthCheck.new(
  protocol: null,
  port: null,
  path: null,
  check_interval: null,
  response_timeout: null,
  unhealthy_threshold: null,
  healthy_threshold: null
)
```
