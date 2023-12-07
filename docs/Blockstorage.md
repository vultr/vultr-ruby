# VultRuby::Blockstorage

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the Block Storage. | [optional] |
| **cost** | **Integer** | The monthly cost of this Block Storage. | [optional] |
| **status** | **String** | The current status of this Block Storage.  * active | [optional] |
| **size_gb** | **Integer** | Size of the Block Storage in GB. | [optional] |
| **region** | **String** | The [Region id](#operation/list-regions) where the Block Storage is located. | [optional] |
| **attached_to_instance** | **String** | The [Instance id](#operation/list-instances) with this Block Storage attached. | [optional] |
| **date_created** | **String** | The date this Block Storage was created. | [optional] |
| **label** | **String** | The user-supplied label. | [optional] |
| **mount_id** | **String** | An ID associated with the instance, when mounted the ID can be found in /dev/disk/by-id prefixed with virtio. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::Blockstorage.new(
  id: null,
  cost: null,
  status: null,
  size_gb: null,
  region: null,
  attached_to_instance: null,
  date_created: null,
  label: null,
  mount_id: null
)
```

