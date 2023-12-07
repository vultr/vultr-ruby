# VultrRuby::DatabaseRestoreFromBackupRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **label** | **String** | A user-supplied label for this Managed Database. |  |
| **type** | **String** | The type of backup restoration to use for this Managed Database. * &#x60;pitr&#x60;: Point-in-time recovery * &#x60;basebackup&#x60;: Latest backup (default if omitted) | [optional] |
| **date** | **String** | The [backup date](#operation/get-backup-information) to use when restoring the Managed Database in YYYY-MM-DD date format. Required for &#x60;pitr&#x60; type requests. | [optional] |
| **time** | **String** | The [backup time](#operation/get-backup-information) to use when restoring the Managed Database in HH-MM-SS time format (24-hour UTC). Required for &#x60;pitr&#x60; type requests. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::DatabaseRestoreFromBackupRequest.new(
  label: null,
  type: null,
  date: null,
  time: null
)
```

