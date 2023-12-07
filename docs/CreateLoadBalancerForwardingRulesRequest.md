# VultRuby::CreateLoadBalancerForwardingRulesRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **frontend_protocol** | **String** | The protocol on the Load Balancer to forward to the backend.  * HTTP * HTTPS * TCP |  |
| **frontend_port** | **Integer** | The port number on the Load Balancer to forward to the backend. |  |
| **backend_protocol** | **String** | The protocol destination on the backend server.  * HTTP * HTTPS * TCP |  |
| **backend_port** | **Integer** | The port number destination on the backend server. |  |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::CreateLoadBalancerForwardingRulesRequest.new(
  frontend_protocol: null,
  frontend_port: null,
  backend_protocol: null,
  backend_port: null
)
```

