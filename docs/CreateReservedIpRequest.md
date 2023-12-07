# VultRuby::CreateReservedIpRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **region** | **String** | The [Region id](#operation/list-regions) where the Reserved IP will be created. |  |
| **ip_type** | **String** | The type of IP address.  * v4 * v6 |  |
| **label** | **String** | The user-supplied label. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::CreateReservedIpRequest.new(
  region: null,
  ip_type: null,
  label: null
)
```

