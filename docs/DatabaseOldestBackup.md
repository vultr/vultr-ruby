# VultRuby::DatabaseOldestBackup

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **String** | The date of the oldest available backup. | [optional] |
| **time** | **String** | The time of the oldest available backup. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::DatabaseOldestBackup.new(
  date: null,
  time: null
)
```

