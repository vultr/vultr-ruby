# VultRuby::ReservedIp

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the Reserved IP. | [optional] |
| **region** | **String** | The [Region id](#operation/list-regions) where the Reserved IP is located. | [optional] |
| **ip_type** | **String** | The type of IP address.  * v4 * v6 | [optional] |
| **subnet** | **String** | The IP subnet. | [optional] |
| **subnet_size** | **Integer** | The IP network size in bits. | [optional] |
| **label** | **String** | The user-supplied label. | [optional] |
| **instance_id** | **String** | The [Instance id](#operation/list-instances) attached to this Reserved IP. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::ReservedIp.new(
  id: null,
  region: null,
  ip_type: null,
  subnet: null,
  subnet_size: null,
  label: null,
  instance_id: null
)
```

