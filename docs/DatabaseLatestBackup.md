# VultRuby::DatabaseLatestBackup

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **String** | The date of the most recently available backup. | [optional] |
| **time** | **String** | The time of the most recently available backup. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::DatabaseLatestBackup.new(
  date: null,
  time: null
)
```

