# VultrRuby::UpdateBlockRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **label** | **String** | The user-supplied label. | [optional] |
| **size_gb** | **Integer** | New size of the Block Storage in GB. Size may range between 10 and 40000 depending on the &#x60;block_type&#x60;. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::UpdateBlockRequest.new(
  label: null,
  size_gb: null
)
```

