# VultRuby::CreateDatabaseUserRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **username** | **String** | The username of the database user. |  |
| **password** | **String** | The password for the database user. This can be omitted to auto-generate a secure password. | [optional] |
| **encryption** | **String** | The password encryption type for the database user (MySQL engine type only). * &#x60;caching_sha2_password&#x60; (default if omitted) * &#x60;mysql_native_password&#x60; | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::CreateDatabaseUserRequest.new(
  username: null,
  password: null,
  encryption: null
)
```

