# VultRuby::CreateObjectStorageRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cluster_id** | **Integer** | The [Cluster id](#operation/list-object-storage-clusters) where the Object Storage will be created. |  |
| **label** | **String** | The user-supplied label for this Object Storage. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::CreateObjectStorageRequest.new(
  cluster_id: null,
  label: null
)
```

