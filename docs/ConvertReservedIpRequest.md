# VultrRuby::ConvertReservedIpRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ip_address** | **String** | The IP address to convert. |  |
| **label** | **String** | A user-supplied label for this IP address. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::ConvertReservedIpRequest.new(
  ip_address: null,
  label: null
)
```

