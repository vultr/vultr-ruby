# VultrRuby::CreateSnapshotRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | Create a Snapshot for this [Instance id](#operation/list-instances). |  |
| **description** | **String** | The user-supplied description of the Snapshot. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::CreateSnapshotRequest.new(
  instance_id: null,
  description: null
)
```

