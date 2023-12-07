# VultrRuby::DatabaseUserAccessControl

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **redis_acl_categories** | **Array&lt;String&gt;** | List of configured rules for command categories. | [optional] |
| **redis_acl_channels** | **Array&lt;String&gt;** | List of configured publish/subscribe channel patterns. | [optional] |
| **redis_acl_commands** | **Array&lt;String&gt;** | List of configured rules for individual commands. | [optional] |
| **redis_acl_keys** | **Array&lt;String&gt;** | List of configured key access rules. | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::DatabaseUserAccessControl.new(
  redis_acl_categories: null,
  redis_acl_channels: null,
  redis_acl_commands: null,
  redis_acl_keys: null
)
```

