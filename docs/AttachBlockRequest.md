# VultrRuby::AttachBlockRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | Attach the Block Storage to this [Instance id](#operation/list-instances). |  |
| **live** | **Boolean** | Attach Block Storage without restarting the Instance.  |   | Value | Description | | - | ----- | ----------- | |   | true | Attach live, do not restart the instance. | |   | false | Restart the instance and attach the Block Storage. | | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::AttachBlockRequest.new(
  instance_id: null,
  live: null
)
```

