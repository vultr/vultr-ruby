# VultRuby::GetInstanceIsoStatus200ResponseIsoStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **iso_id** | **String** | The [ISO id](#operation/list-isos). | [optional] |
| **state** | **String** | The status of this ISO. * ready * attached | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::GetInstanceIsoStatus200ResponseIsoStatus.new(
  iso_id: null,
  state: null
)
```

