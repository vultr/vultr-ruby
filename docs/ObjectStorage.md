# VultRuby::ObjectStorage

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the Object Storage. | [optional] |
| **date_created** | **String** | Date the Object Store was created. | [optional] |
| **cluster_id** | **Integer** | The [Cluster id](#operation/list-object-storage-clusters). | [optional] |
| **region** | **String** | The [Region id](#operation/list-regions) for this Object Storage. | [optional] |
| **label** | **String** | The user-supplied label for this Object Storage. | [optional] |
| **status** | **String** | The status of this Object Storage.  * active * pending | [optional] |
| **s3_hostname** | **String** | The [Cluster hostname](#operation/list-object-storage-clusters) for this Object Storage. | [optional] |
| **s3_access_key** | **String** | The Object Storage access key. | [optional] |
| **s3_secret_key** | **String** | The Object Storage secret key. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::ObjectStorage.new(
  id: null,
  date_created: null,
  cluster_id: null,
  region: null,
  label: null,
  status: null,
  s3_hostname: null,
  s3_access_key: null,
  s3_secret_key: null
)
```

