# VultrRuby::Ssh

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique ID for the SSH Key. | [optional] |
| **date_created** | **String** | The date this SSH Key was created. | [optional] |
| **name** | **String** | The user-supplied name for this SSH Key. | [optional] |
| **ssh_key** | **String** | The SSH Key. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::Ssh.new(
  id: null,
  date_created: null,
  name: null,
  ssh_key: null
)
```

