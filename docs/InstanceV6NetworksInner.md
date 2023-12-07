# VultRuby::InstanceV6NetworksInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **network** | **String** | The IPv6 subnet. | [optional] |
| **main_ip** | **String** | The main IPv6 network address. | [optional] |
| **network_size** | **Integer** | The IPv6 network size in bits. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::InstanceV6NetworksInner.new(
  network: null,
  main_ip: null,
  network_size: null
)
```

