# VultRuby::Meta

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **total** | **Integer** | Total objects available in the list. This value may be greater than the number of objects returned if &#x60;per_page&#x60; is set. | [optional] |
| **links** | [**MetaLinks**](MetaLinks.md) |  | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::Meta.new(
  total: null,
  links: null
)
```

