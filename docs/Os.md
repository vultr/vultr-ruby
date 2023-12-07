# VultrRuby::Os

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The Operating System id. | [optional] |
| **name** | **String** | The Operating System description. | [optional] |
| **arch** | **String** | The Operating System architecture. | [optional] |
| **family** | **String** | The Operating System family.  | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::Os.new(
  id: null,
  name: null,
  arch: null,
  family: null
)
```

