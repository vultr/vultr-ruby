# VultRuby::DatabaseUsageMemory

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **current_mb** | **String** | The current amount of memory used on the Managed Database (in MB). | [optional] |
| **max_mb** | **String** | The maximum available memory on the Managed Database (in MB). | [optional] |
| **percentage** | **String** | The average percent of memory utilization for the Managed Database over the last hour. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::DatabaseUsageMemory.new(
  current_mb: null,
  max_mb: null,
  percentage: null
)
```

