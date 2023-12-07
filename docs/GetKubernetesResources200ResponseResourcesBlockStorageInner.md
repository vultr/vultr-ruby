# VultrRuby::GetKubernetesResources200ResponseResourcesBlockStorageInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier for the block storage volume | [optional] |
| **label** | **String** | Label given to the block storage volume | [optional] |
| **date_created** | **String** | Date the block storage volume was created | [optional] |
| **status** | **String** | Status of the block storage volume | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::GetKubernetesResources200ResponseResourcesBlockStorageInner.new(
  id: null,
  label: null,
  date_created: null,
  status: null
)
```

