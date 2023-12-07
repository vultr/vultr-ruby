# VultRuby::RegistryRepository

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The name of this repository (the name of the container image prepended with the registry name) | [optional] |
| **image** | **String** | The name of the conatiner image | [optional] |
| **description** | **String** | User defined description of this repository | [optional] |
| **added_at** | **String** | The date this Repo was added | [optional] |
| **updated_at** | **String** | The date this Repo was last updated | [optional] |
| **pull_count** | **Integer** | The amount of pulls for this Repo | [optional] |
| **artifact_count** | **Integer** | The amount of artifacts of this Repo | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::RegistryRepository.new(
  name: null,
  image: null,
  description: null,
  added_at: null,
  updated_at: null,
  pull_count: null,
  artifact_count: null
)
```

