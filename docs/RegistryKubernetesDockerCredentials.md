# VultRuby::RegistryKubernetesDockerCredentials

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **api_version** | **String** | Specifies that this is api v1 | [optional] |
| **kind** | **String** | Specifies that this is a Kubernetes Secret | [optional] |
| **metadata** | [**RegistryKubernetesDockerCredentialsMetadata**](RegistryKubernetesDockerCredentialsMetadata.md) |  | [optional] |
| **data** | [**RegistryKubernetesDockerCredentialsData**](RegistryKubernetesDockerCredentialsData.md) |  | [optional] |
| **type** | **String** | Specifies that this type is a kubernetes.io/dockerconfigjson | [optional] |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::RegistryKubernetesDockerCredentials.new(
  api_version: null,
  kind: null,
  metadata: null,
  data: null,
  type: null
)
```

