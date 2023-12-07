# VultRuby::Registry

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The UUID to reference this registry | [optional] |
| **name** | **String** | The globally unique name to reference this registry | [optional] |
| **urn** | **String** | The base URN (the URL without the scheme [i.e. http:// or https://]) of this registry | [optional] |
| **storage** | [**RegistryStorage**](RegistryStorage.md) |  | [optional] |
| **date_created** | **String** | The date this Registry Subscription was created | [optional] |
| **public** | **Boolean** | If true, this is a publically accessible registry allowing anyone to pull from it. If false, this registry is completely private | [optional] |
| **root_user** | [**RegistryUser**](RegistryUser.md) |  | [optional] |
| **metadata** | [**RegistryMetadata**](RegistryMetadata.md) |  | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::Registry.new(
  id: null,
  name: null,
  urn: null,
  storage: null,
  date_created: null,
  public: null,
  root_user: null,
  metadata: null
)
```

