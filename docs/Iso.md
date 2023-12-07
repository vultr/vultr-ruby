# VultRuby::Iso

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the ISO. | [optional] |
| **date_created** | **String** | Date the ISO was created. | [optional] |
| **filename** | **String** | The ISO filename. | [optional] |
| **size** | **Integer** | The ISO size in KB. | [optional] |
| **md5sum** | **String** | The calculated md5sum of the ISO. | [optional] |
| **sha512sum** | **String** | The calculated sha512sum of the ISO. | [optional] |
| **status** | **String** | The current status of the ISO.  * complete * pending | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::Iso.new(
  id: null,
  date_created: null,
  filename: null,
  size: null,
  md5sum: null,
  sha512sum: null,
  status: null
)
```

