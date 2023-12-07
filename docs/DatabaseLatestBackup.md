# VultrRuby::DatabaseLatestBackup

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **String** | The date of the most recently available backup. | [optional] |
| **time** | **String** | The time of the most recently available backup. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::DatabaseLatestBackup.new(
  date: null,
  time: null
)
```

