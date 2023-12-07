# VultrRuby::CreateStartupScriptRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The name of the Startup Script. |  |
| **type** | **String** | The Startup Script type.  * boot (default) * pxe | [optional] |
| **script** | **String** | The base-64 encoded Startup Script. |  |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::CreateStartupScriptRequest.new(
  name: null,
  type: null,
  script: null
)
```

