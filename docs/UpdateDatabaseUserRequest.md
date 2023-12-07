# VultrRuby::UpdateDatabaseUserRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **password** | **String** | The password for the database user. This can be empty to auto-generate a new secure password. |  |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::UpdateDatabaseUserRequest.new(
  password: null
)
```

