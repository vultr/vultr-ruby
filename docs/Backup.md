# VultRuby::Backup

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the backup. | [optional] |
| **date_created** | **String** | The date the backup was created. | [optional] |
| **description** | **String** | The user-supplied description of this backup. | [optional] |
| **size** | **Integer** | The size of the backup in Bytes. | [optional] |
| **status** | **String** | The Backup status.  * complete * pending | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::Backup.new(
  id: null,
  date_created: null,
  description: null,
  size: null,
  status: null
)
```

