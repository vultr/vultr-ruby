# VultrRuby::Domain

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **domain** | **String** | Your registered domain name. | [optional] |
| **date_created** | **String** | Date the DNS Domain was created. | [optional] |
| **dns_sec** | **String** | The domain&#39;s DNSSEC status  * enabled * disabled | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::Domain.new(
  domain: null,
  date_created: null,
  dns_sec: null
)
```

