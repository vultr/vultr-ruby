# VultRuby::GetBackupInformation200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **latest_backup** | [**DatabaseLatestBackup**](DatabaseLatestBackup.md) |  | [optional] |
| **oldest_backup** | [**DatabaseOldestBackup**](DatabaseOldestBackup.md) |  | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::GetBackupInformation200Response.new(
  latest_backup: null,
  oldest_backup: null
)
```

