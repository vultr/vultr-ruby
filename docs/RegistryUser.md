# VultrRuby::RegistryUser

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The Numeric ID of this user. | [optional] |
| **username** | **String** | The globally unique name of this user. | [optional] |
| **password** | **String** | The password this user will use to authenticate. | [optional] |
| **root** | **Boolean** | If true, this is a root user/registry owner meaning it cannot be deleted or renamed. If false, this is an additional user added to this registry that can be modified | [optional] |
| **added_at** | **String** | The date this User was added | [optional] |
| **updated_at** | **String** | The date this User was last updated | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::RegistryUser.new(
  id: null,
  username: null,
  password: null,
  root: null,
  added_at: null,
  updated_at: null
)
```

