# VultrRuby::ForwardingRule

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the Forwarding Rule. | [optional] |
| **frontend_protocol** | **String** | The protocol on the Load Balancer to forward to the backend.  * HTTP * HTTPS * TCP | [optional] |
| **frontend_port** | **Integer** | The port number on the Load Balancer to forward to the backend. | [optional] |
| **backend_protocol** | **String** | The protocol destination on the backend server.  * HTTP * HTTPS * TCP | [optional] |
| **backend_port** | **Integer** | The port number destination on the backend server. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::ForwardingRule.new(
  id: null,
  frontend_protocol: null,
  frontend_port: null,
  backend_protocol: null,
  backend_port: null
)
```

