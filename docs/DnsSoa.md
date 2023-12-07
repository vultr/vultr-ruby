# VultrRuby::DnsSoa

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **nsprimary** | **String** | Primary nameserver for this domain. | [optional] |
| **email** | **String** | Domain contact email address. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::DnsSoa.new(
  nsprimary: null,
  email: null
)
```

