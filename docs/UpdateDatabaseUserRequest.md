# VultRuby::UpdateDatabaseUserRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **password** | **String** | The password for the database user. This can be empty to auto-generate a new secure password. |  |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::UpdateDatabaseUserRequest.new(
  password: null
)
```

