# VultRuby::CreateDnsDomainRecordRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The hostname for this DNS record. |  |
| **type** | **String** | The DNS record type.  * A * AAAA * CNAME * NS * MX * SRV * TXT * CAA * SSHFP |  |
| **data** | **String** | The DNS data for this record type. |  |
| **ttl** | **Integer** | Time to Live in seconds. | [optional] |
| **priority** | **Integer** | DNS priority. Does not apply to all record types. (Only required for MX and SRV) | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::CreateDnsDomainRecordRequest.new(
  name: null,
  type: null,
  data: null,
  ttl: null,
  priority: null
)
```

