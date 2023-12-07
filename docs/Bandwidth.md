# VultrRuby::Bandwidth

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **incoming_bytes** | **Integer** | Total bytes received by this instance on the date (UTC) denoted by the object key. | [optional] |
| **outgoing_bytes** | **Integer** | Total bytes sent by this instance on the date (UTC) denoted by the object key. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::Bandwidth.new(
  incoming_bytes: null,
  outgoing_bytes: null
)
```

