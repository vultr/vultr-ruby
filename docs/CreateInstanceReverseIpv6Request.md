# VultrRuby::CreateInstanceReverseIpv6Request

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ip** | **String** | The IPv6 address in full, expanded format. |  |
| **reverse** | **String** | The IPv6 reverse entry. |  |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::CreateInstanceReverseIpv6Request.new(
  ip: null,
  reverse: null
)
```

