# VultRuby::CreateRegistryRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | [**Name**](Name.md) |  |  |
| **public** | [**Public**](Public.md) |  |  |
| **region** | **String** | The name of the region you&#39;d like to deploy this Registry in. Can get list of regions from /registry/region/list endpoint i.e. sjc |  |
| **plan** | **String** | The key of the plan you&#39;d like to select which dictates how much storage you&#39;re allocated and the monthly cost. Can get list of plans from /plan/list endpoint i.e. start_up |  |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::CreateRegistryRequest.new(
  name: null,
  public: null,
  region: null,
  plan: null
)
```

