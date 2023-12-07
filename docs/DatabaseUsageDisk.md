# VultrRuby::DatabaseUsageDisk

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **current_gb** | **String** | The current amount of space used on the Managed Database (in GB). | [optional] |
| **max_gb** | **String** | The maximum available space on the Managed Database (in GB). | [optional] |
| **percentage** | **String** | The percentage of space used on the Managed Database relative to its capacity. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::DatabaseUsageDisk.new(
  current_gb: null,
  max_gb: null,
  percentage: null
)
```

