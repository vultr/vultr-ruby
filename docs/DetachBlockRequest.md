# VultRuby::DetachBlockRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **live** | **Boolean** | Detach Block Storage without restarting the Instance.  |   | Value | Description | | - | ----- | ----------- | |   | true | Detach live, do not restart the instance. | |   | false | Restart the instance and detach the Block Storage. | | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::DetachBlockRequest.new(
  live: null
)
```

