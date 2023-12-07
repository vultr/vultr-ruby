# VultrRuby::Clusters

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | A unique ID for the Object Storage cluster. | [optional] |
| **region** | **String** | The [Region id](#operation/list-regions) where the cluster is located. | [optional] |
| **hostname** | **String** | The cluster host name. | [optional] |
| **deploy** | **String** | The Cluster is eligible for Object Storage deployment.  * yes * no | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::Clusters.new(
  id: null,
  region: null,
  hostname: null,
  deploy: null
)
```

