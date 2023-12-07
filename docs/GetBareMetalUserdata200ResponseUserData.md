# VultRuby::GetBareMetalUserdata200ResponseUserData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | **String** | The user-supplied, base64 encoded [user data](https://www.vultr.com/docs/manage-instance-user-data-with-the-vultr-metadata-api/) attached to this bare metal. | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::GetBareMetalUserdata200ResponseUserData.new(
  data: null
)
```

