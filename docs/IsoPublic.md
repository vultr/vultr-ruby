# VultrRuby::IsoPublic

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the Vultr Public ISO. | [optional] |
| **name** | **String** | The short name of the Public ISO. | [optional] |
| **description** | **String** | The long description of the Public ISO. | [optional] |
| **md5sum** | **String** |  | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::IsoPublic.new(
  id: null,
  name: null,
  description: null,
  md5sum: null
)
```

