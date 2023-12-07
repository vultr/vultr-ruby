# VultrRuby::UpdateDnsDomainRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **dns_sec** | **String** | Enable or disable DNSSEC.  * enabled * disabled |  |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::UpdateDnsDomainRequest.new(
  dns_sec: null
)
```

