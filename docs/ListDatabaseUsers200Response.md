# VultrRuby::ListDatabaseUsers200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **users** | [**Array&lt;DatabaseUser&gt;**](DatabaseUser.md) |  | [optional] |
| **meta** | [**DbaasMeta**](DbaasMeta.md) |  | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::ListDatabaseUsers200Response.new(
  users: null,
  meta: null
)
```

