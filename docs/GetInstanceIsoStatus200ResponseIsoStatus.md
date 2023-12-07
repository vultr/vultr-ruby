# VultrRuby::GetInstanceIsoStatus200ResponseIsoStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **iso_id** | **String** | The [ISO id](#operation/list-isos). | [optional] |
| **state** | **String** | The status of this ISO. * ready * attached | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::GetInstanceIsoStatus200ResponseIsoStatus.new(
  iso_id: null,
  state: null
)
```

