# VultrRuby::AttachInstanceIsoRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **iso_id** | **String** | The [ISO id](#operation/list-isos) to attach to this Instance. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::AttachInstanceIsoRequest.new(
  iso_id: null
)
```

