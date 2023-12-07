# VultRuby::CreateSnapshotRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | Create a Snapshot for this [Instance id](#operation/list-instances). |  |
| **description** | **String** | The user-supplied description of the Snapshot. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::CreateSnapshotRequest.new(
  instance_id: null,
  description: null
)
```

