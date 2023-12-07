# VultRuby::RestoreInstanceRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **backup_id** | **String** | The [Backup id](#operation/list-backups) used to restore this instance. | [optional] |
| **snapshot_id** | **String** | The [Snapshot id](#operation/list-snapshots) used to restore this instance. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::RestoreInstanceRequest.new(
  backup_id: null,
  snapshot_id: null
)
```

