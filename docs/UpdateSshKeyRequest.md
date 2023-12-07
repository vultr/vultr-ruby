# VultrRuby::UpdateSshKeyRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The user-supplied name for this SSH Key. | [optional] |
| **ssh_key** | **String** | The SSH Key. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::UpdateSshKeyRequest.new(
  name: null,
  ssh_key: null
)
```

