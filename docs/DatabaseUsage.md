# VultrRuby::DatabaseUsage

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **disk** | [**DatabaseUsageDisk**](DatabaseUsageDisk.md) |  | [optional] |
| **memory** | [**DatabaseUsageMemory**](DatabaseUsageMemory.md) |  | [optional] |
| **cpu** | [**DatabaseUsageCpu**](DatabaseUsageCpu.md) |  | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::DatabaseUsage.new(
  disk: null,
  memory: null,
  cpu: null
)
```

