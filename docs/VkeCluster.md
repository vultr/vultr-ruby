# VultrRuby::VkeCluster

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | ID for the VKE cluster | [optional] |
| **firewall_group_id** | **String** | The [Firewall Group id](#operation/list-firewall-groups) linked to this cluster. | [optional] |
| **label** | **String** | Label for your cluster | [optional] |
| **date_created** | **String** | Date of creation | [optional] |
| **cluster_subnet** | **String** | IP range that your pods will run on in this cluster | [optional] |
| **service_subnet** | **String** | IP range that services will run on this cluster | [optional] |
| **ip** | **String** | IP for your Kubernetes Clusters Control Plane | [optional] |
| **endpoint** | **String** | Domain for your Kubernetes Clusters Control Plane | [optional] |
| **version** | **String** | Version of Kubernetes this cluster is running on | [optional] |
| **region** | **String** | Region this Kubernetes Cluster is running in | [optional] |
| **status** | **String** | Status for VKE cluster | [optional] |
| **ha_controlplanes** | **Boolean** | Whether a highly available control planes configuration has been deployed * true * false (default) | [optional] |
| **node_pools** | [**Array&lt;Nodepools&gt;**](Nodepools.md) | NodePools in this cluster | [optional] |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::VkeCluster.new(
  id: null,
  firewall_group_id: null,
  label: null,
  date_created: null,
  cluster_subnet: null,
  service_subnet: null,
  ip: null,
  endpoint: null,
  version: null,
  region: null,
  status: null,
  ha_controlplanes: null,
  node_pools: null
)
```

