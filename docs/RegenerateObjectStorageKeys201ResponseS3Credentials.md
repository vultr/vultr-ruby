# VultRuby::RegenerateObjectStorageKeys201ResponseS3Credentials

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **s3_hostname** | **String** | The [Cluster hostname](#operation/list-object-storage-clusters) for this Object Storage. | [optional] |
| **s3_access_key** | **String** | The new Object Storage access key. | [optional] |
| **s3_secret_key** | **String** | The new Object Storage secret key. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::RegenerateObjectStorageKeys201ResponseS3Credentials.new(
  s3_hostname: null,
  s3_access_key: null,
  s3_secret_key: null
)
```

