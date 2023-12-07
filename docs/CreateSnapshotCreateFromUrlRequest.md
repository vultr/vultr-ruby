# VultRuby::CreateSnapshotCreateFromUrlRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **url** | **String** | The public URL containing a RAW image. |  |
| **description** | **String** | The user-supplied description of the Snapshot. | [optional] |
| **uefi** | **String** | Whether or not the snapshot uses UEFI. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::CreateSnapshotCreateFromUrlRequest.new(
  url: null,
  description: null,
  uefi: null
)
```

