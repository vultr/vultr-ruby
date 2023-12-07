# VultrRuby::GetInstanceUserdata200ResponseUserData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | **String** | The user-supplied, base64 encoded [user data](https://www.vultr.com/docs/manage-instance-user-data-with-the-vultr-metadata-api/) attached to this instance. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::GetInstanceUserdata200ResponseUserData.new(
  data: null
)
```

