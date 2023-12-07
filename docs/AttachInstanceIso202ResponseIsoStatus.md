# VultRuby::AttachInstanceIso202ResponseIsoStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **state** | **String** | State of the ISO  * ismounting | [optional] |
| **iso_id** | **String** | The [ISO id](#operation/list-isos) being attached. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::AttachInstanceIso202ResponseIsoStatus.new(
  state: null,
  iso_id: null
)
```

