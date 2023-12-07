# VultRuby::DnsSoa

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **nsprimary** | **String** | Primary nameserver for this domain. | [optional] |
| **email** | **String** | Domain contact email address. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::DnsSoa.new(
  nsprimary: null,
  email: null
)
```

