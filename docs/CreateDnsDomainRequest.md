# VultrRuby::CreateDnsDomainRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **domain** | **String** | Your registered DNS Domain name. |  |
| **ip** | **String** | The default IP address for your DNS Domain. If omitted an empty domain zone will be created. | [optional] |
| **dns_sec** | **String** | Enable or disable DNSSEC.  * enabled * disabled (default) | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::CreateDnsDomainRequest.new(
  domain: null,
  ip: null,
  dns_sec: null
)
```

