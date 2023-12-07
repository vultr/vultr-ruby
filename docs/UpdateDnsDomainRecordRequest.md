# VultrRuby::UpdateDnsDomainRecordRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The hostname for this DNS record. | [optional] |
| **data** | **String** | The DNS data for this record type. | [optional] |
| **ttl** | **Integer** | Time to Live in seconds. | [optional] |
| **priority** | **Integer** | DNS priority. Does not apply to all record types. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::UpdateDnsDomainRecordRequest.new(
  name: null,
  data: null,
  ttl: null,
  priority: null
)
```

