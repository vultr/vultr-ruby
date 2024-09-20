# VultrRuby::CreateRegistryRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The globally unique name to reference this registry |  |
| **public** | **Boolean** | If true, this is a publically accessible registry allowing anyone to pull from it. If false, this registry is completely private |  |
| **region** | **String** | The name of the region you&#39;d like to deploy this Registry in. Can get list of regions from /registry/region/list endpoint i.e. sjc |  |
| **plan** | **String** | The key of the plan you&#39;d like to select which dictates how much storage you&#39;re allocated and the monthly cost. Can get list of plans from /plan/list endpoint i.e. start_up |  |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::CreateRegistryRequest.new(
  name: null,
  public: null,
  region: null,
  plan: null
)
```

