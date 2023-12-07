# VultRuby::Bandwidth

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **incoming_bytes** | **Integer** | Total bytes received by this instance on the date (UTC) denoted by the object key. | [optional] |
| **outgoing_bytes** | **Integer** | Total bytes sent by this instance on the date (UTC) denoted by the object key. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::Bandwidth.new(
  incoming_bytes: null,
  outgoing_bytes: null
)
```

