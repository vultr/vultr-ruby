# VultrRuby::CreateSshKeyRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The user-supplied name for this SSH Key. |  |
| **ssh_key** | **String** | The SSH Key. |  |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::CreateSshKeyRequest.new(
  name: null,
  ssh_key: null
)
```

