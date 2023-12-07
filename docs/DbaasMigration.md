# VultrRuby::DbaasMigration

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** | The current status of the attached migration. * &#x60;complete&#x60; * &#x60;error&#x60; * &#x60;pending&#x60; * &#x60;running&#x60; | [optional] |
| **method** | **String** | The type of migration performed (dump or replication). Only shows if status is &#x60;complete&#x60;. | [optional] |
| **error** | **String** | The verbose error message output for migrations with an &#x60;error&#x60; status. | [optional] |
| **credentials** | [**DbaasMigrationCredentials**](DbaasMigrationCredentials.md) |  | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::DbaasMigration.new(
  status: null,
  method: null,
  error: null,
  credentials: null
)
```

