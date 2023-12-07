# VultrRuby::Snapshot

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the Snapshot. | [optional] |
| **date_created** | **String** | The date this snapshot was created. | [optional] |
| **description** | **String** | The user-supplied description of the Snapshot. | [optional] |
| **size** | **Integer** | The snapshot size in bytes. | [optional] |
| **status** | **String** | The Snapshot status.  * pending * complete * deleted | [optional] |
| **os_id** | **Integer** | The [Operating System id](#operation/list-os) for this Snapshot. | [optional] |
| **app_id** | **Integer** | The [Application id](#operation/list-applications) for this snapshot. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::Snapshot.new(
  id: null,
  date_created: null,
  description: null,
  size: null,
  status: null,
  os_id: null,
  app_id: null
)
```

