# VultRuby::RegistryRegion

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The Numeric ID of this region. | [optional] |
| **name** | **String** | The unique name of this region, this is what you will use to specify a region when creating your subscription | [optional] |
| **urn** | **String** | The base URN (the URL without the scheme [i.e. http:// or https://]) of this region | [optional] |
| **base_url** | **String** | The base URL of this region | [optional] |
| **public** | **Boolean** | If true, this is a publically accessible region allowing any customer to create new subscriptions on this region. If false, this region is not generally available yet | [optional] |
| **added_at** | **String** | The date this Region was added | [optional] |
| **updated_at** | **String** | The date this Region was last updated | [optional] |
| **data_center** | **Object** | Information on the datacenter this region resides in | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::RegistryRegion.new(
  id: null,
  name: null,
  urn: null,
  base_url: null,
  public: null,
  added_at: null,
  updated_at: null,
  data_center: null
)
```

