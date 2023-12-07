# VultrRuby::UpdateDnsDomainSoaRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **nsprimary** | **String** | Set the primary nameserver. | [optional] |
| **email** | **String** | Set the contact email address. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::UpdateDnsDomainSoaRequest.new(
  nsprimary: null,
  email: null
)
```

