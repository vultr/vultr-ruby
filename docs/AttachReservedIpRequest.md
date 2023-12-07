# VultRuby::AttachReservedIpRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | Attach the Reserved IP to a [Compute Instance id](#operation/list-instances) or a [Bare Metal Instance id](#operation/list-baremetals). |  |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::AttachReservedIpRequest.new(
  instance_id: null
)
```

