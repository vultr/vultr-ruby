# VultRuby::CreateLoadBalancerRequestForwardingRulesInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **frontend_protocol** | **String** | The protocol on the Load Balancer to forward to the backend.  * HTTP * HTTPS * TCP | [optional] |
| **frontend_port** | **Integer** | The port number on the Load Balancer to forward to the backend. | [optional] |
| **backend_protocol** | **String** | The protocol destination on the backend server.  * HTTP * HTTPS * TCP | [optional] |
| **backend_port** | **Integer** | The port number destination on the backend server. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::CreateLoadBalancerRequestForwardingRulesInner.new(
  frontend_protocol: null,
  frontend_port: null,
  backend_protocol: null,
  backend_port: null
)
```

