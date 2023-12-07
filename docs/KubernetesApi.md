# VultRuby::KubernetesApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_kubernetes_cluster**](KubernetesApi.md#create_kubernetes_cluster) | **POST** /kubernetes/clusters | Create Kubernetes Cluster |
| [**create_nodepools**](KubernetesApi.md#create_nodepools) | **POST** /kubernetes/clusters/{vke-id}/node-pools | Create NodePool |
| [**delete_kubernetes_cluster**](KubernetesApi.md#delete_kubernetes_cluster) | **DELETE** /kubernetes/clusters/{vke-id} | Delete Kubernetes Cluster |
| [**delete_kubernetes_cluster_vke_id_delete_with_linked_resources**](KubernetesApi.md#delete_kubernetes_cluster_vke_id_delete_with_linked_resources) | **DELETE** /kubernetes/clusters/{vke-id}/delete-with-linked-resources | Delete VKE Cluster and All Related Resources |
| [**delete_nodepool**](KubernetesApi.md#delete_nodepool) | **DELETE** /kubernetes/clusters/{vke-id}/node-pools/{nodepool-id} | Delete Nodepool |
| [**delete_nodepool_instance**](KubernetesApi.md#delete_nodepool_instance) | **DELETE** /kubernetes/clusters/{vke-id}/node-pools/{nodepool-id}/nodes/{node-id} | Delete NodePool Instance |
| [**get_kubernetes_available_upgrades**](KubernetesApi.md#get_kubernetes_available_upgrades) | **GET** /kubernetes/clusters/{vke-id}/available-upgrades | Get Kubernetes Available Upgrades |
| [**get_kubernetes_clusters**](KubernetesApi.md#get_kubernetes_clusters) | **GET** /kubernetes/clusters/{vke-id} | Get Kubernetes Cluster |
| [**get_kubernetes_clusters_config**](KubernetesApi.md#get_kubernetes_clusters_config) | **GET** /kubernetes/clusters/{vke-id}/config | Get Kubernetes Cluster Kubeconfig |
| [**get_kubernetes_resources**](KubernetesApi.md#get_kubernetes_resources) | **GET** /kubernetes/clusters/{vke-id}/resources | Get Kubernetes Resources |
| [**get_kubernetes_versions**](KubernetesApi.md#get_kubernetes_versions) | **GET** /kubernetes/versions | Get Kubernetes Versions |
| [**get_nodepool**](KubernetesApi.md#get_nodepool) | **GET** /kubernetes/clusters/{vke-id}/node-pools/{nodepool-id} | Get NodePool |
| [**get_nodepools**](KubernetesApi.md#get_nodepools) | **GET** /kubernetes/clusters/{vke-id}/node-pools | List NodePools |
| [**list_kubernetes_clusters**](KubernetesApi.md#list_kubernetes_clusters) | **GET** /kubernetes/clusters | List all Kubernetes Clusters |
| [**recycle_nodepool_instance**](KubernetesApi.md#recycle_nodepool_instance) | **POST** /kubernetes/clusters/{vke-id}/node-pools/{nodepool-id}/nodes/{node-id}/recycle | Recycle a NodePool Instance |
| [**start_kubernetes_cluster_upgrade**](KubernetesApi.md#start_kubernetes_cluster_upgrade) | **POST** /kubernetes/clusters/{vke-id}/upgrades | Start Kubernetes Cluster Upgrade |
| [**update_kubernetes_cluster**](KubernetesApi.md#update_kubernetes_cluster) | **PUT** /kubernetes/clusters/{vke-id} | Update Kubernetes Cluster |
| [**update_nodepool**](KubernetesApi.md#update_nodepool) | **PATCH** /kubernetes/clusters/{vke-id}/node-pools/{nodepool-id} | Update Nodepool |


## create_kubernetes_cluster

> <CreateKubernetesCluster201Response> create_kubernetes_cluster(opts)

Create Kubernetes Cluster

Create Kubernetes Cluster

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::KubernetesApi.new
opts = {
  create_kubernetes_cluster_request: VultRuby::CreateKubernetesClusterRequest.new({region: 'region_example', version: 'version_example'}) # CreateKubernetesClusterRequest | Request Body
}

begin
  # Create Kubernetes Cluster
  result = api_instance.create_kubernetes_cluster(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->create_kubernetes_cluster: #{e}"
end
```

#### Using the create_kubernetes_cluster_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateKubernetesCluster201Response>, Integer, Hash)> create_kubernetes_cluster_with_http_info(opts)

```ruby
begin
  # Create Kubernetes Cluster
  data, status_code, headers = api_instance.create_kubernetes_cluster_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateKubernetesCluster201Response>
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->create_kubernetes_cluster_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_kubernetes_cluster_request** | [**CreateKubernetesClusterRequest**](CreateKubernetesClusterRequest.md) | Request Body | [optional] |

### Return type

[**CreateKubernetesCluster201Response**](CreateKubernetesCluster201Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_nodepools

> <CreateNodepools201Response> create_nodepools(vke_id, opts)

Create NodePool

Create NodePool for a Existing Kubernetes Cluster

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::KubernetesApi.new
vke_id = 'vke_id_example' # String | The [VKE ID](#operation/list-kubernetes-clusters).
opts = {
  create_nodepools_request: VultRuby::CreateNodepoolsRequest.new({node_quantity: 37, label: 'label_example', plan: 'plan_example'}) # CreateNodepoolsRequest | Request Body
}

begin
  # Create NodePool
  result = api_instance.create_nodepools(vke_id, opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->create_nodepools: #{e}"
end
```

#### Using the create_nodepools_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateNodepools201Response>, Integer, Hash)> create_nodepools_with_http_info(vke_id, opts)

```ruby
begin
  # Create NodePool
  data, status_code, headers = api_instance.create_nodepools_with_http_info(vke_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateNodepools201Response>
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->create_nodepools_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vke_id** | **String** | The [VKE ID](#operation/list-kubernetes-clusters). |  |
| **create_nodepools_request** | [**CreateNodepoolsRequest**](CreateNodepoolsRequest.md) | Request Body | [optional] |

### Return type

[**CreateNodepools201Response**](CreateNodepools201Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_kubernetes_cluster

> delete_kubernetes_cluster(vke_id)

Delete Kubernetes Cluster

Delete Kubernetes Cluster

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::KubernetesApi.new
vke_id = 'vke_id_example' # String | The [VKE ID](#operation/list-kubernetes-clusters).

begin
  # Delete Kubernetes Cluster
  api_instance.delete_kubernetes_cluster(vke_id)
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->delete_kubernetes_cluster: #{e}"
end
```

#### Using the delete_kubernetes_cluster_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_kubernetes_cluster_with_http_info(vke_id)

```ruby
begin
  # Delete Kubernetes Cluster
  data, status_code, headers = api_instance.delete_kubernetes_cluster_with_http_info(vke_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->delete_kubernetes_cluster_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vke_id** | **String** | The [VKE ID](#operation/list-kubernetes-clusters). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## delete_kubernetes_cluster_vke_id_delete_with_linked_resources

> delete_kubernetes_cluster_vke_id_delete_with_linked_resources(vke_id)

Delete VKE Cluster and All Related Resources

Delete Kubernetes Cluster and all related resources. 

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::KubernetesApi.new
vke_id = 'vke_id_example' # String | 

begin
  # Delete VKE Cluster and All Related Resources
  api_instance.delete_kubernetes_cluster_vke_id_delete_with_linked_resources(vke_id)
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->delete_kubernetes_cluster_vke_id_delete_with_linked_resources: #{e}"
end
```

#### Using the delete_kubernetes_cluster_vke_id_delete_with_linked_resources_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_kubernetes_cluster_vke_id_delete_with_linked_resources_with_http_info(vke_id)

```ruby
begin
  # Delete VKE Cluster and All Related Resources
  data, status_code, headers = api_instance.delete_kubernetes_cluster_vke_id_delete_with_linked_resources_with_http_info(vke_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->delete_kubernetes_cluster_vke_id_delete_with_linked_resources_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vke_id** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## delete_nodepool

> delete_nodepool(vke_id, nodepool_id)

Delete Nodepool

Delete a NodePool from a Kubernetes Cluster

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::KubernetesApi.new
vke_id = 'vke_id_example' # String | The [VKE ID](#operation/list-kubernetes-clusters).
nodepool_id = 'nodepool_id_example' # String | The [NodePool ID](#operation/get-nodepools).

begin
  # Delete Nodepool
  api_instance.delete_nodepool(vke_id, nodepool_id)
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->delete_nodepool: #{e}"
end
```

#### Using the delete_nodepool_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_nodepool_with_http_info(vke_id, nodepool_id)

```ruby
begin
  # Delete Nodepool
  data, status_code, headers = api_instance.delete_nodepool_with_http_info(vke_id, nodepool_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->delete_nodepool_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vke_id** | **String** | The [VKE ID](#operation/list-kubernetes-clusters). |  |
| **nodepool_id** | **String** | The [NodePool ID](#operation/get-nodepools). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## delete_nodepool_instance

> delete_nodepool_instance(vke_id, nodepool_id, node_id)

Delete NodePool Instance

Delete a single nodepool instance from a given Nodepool

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::KubernetesApi.new
vke_id = 'vke_id_example' # String | The [VKE ID](#operation/list-kubernetes-clusters).
nodepool_id = 'nodepool_id_example' # String | The [NodePool ID](#operation/get-nodepools).
node_id = 'node_id_example' # String | The [Instance ID](#operation/list-instances).

begin
  # Delete NodePool Instance
  api_instance.delete_nodepool_instance(vke_id, nodepool_id, node_id)
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->delete_nodepool_instance: #{e}"
end
```

#### Using the delete_nodepool_instance_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_nodepool_instance_with_http_info(vke_id, nodepool_id, node_id)

```ruby
begin
  # Delete NodePool Instance
  data, status_code, headers = api_instance.delete_nodepool_instance_with_http_info(vke_id, nodepool_id, node_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->delete_nodepool_instance_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vke_id** | **String** | The [VKE ID](#operation/list-kubernetes-clusters). |  |
| **nodepool_id** | **String** | The [NodePool ID](#operation/get-nodepools). |  |
| **node_id** | **String** | The [Instance ID](#operation/list-instances). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_kubernetes_available_upgrades

> <GetKubernetesAvailableUpgrades200Response> get_kubernetes_available_upgrades(vke_id)

Get Kubernetes Available Upgrades

Get the available upgrades for the specified Kubernetes cluster.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::KubernetesApi.new
vke_id = 'vke_id_example' # String | The [VKE ID](#operation/list-kubernetes-clusters).

begin
  # Get Kubernetes Available Upgrades
  result = api_instance.get_kubernetes_available_upgrades(vke_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->get_kubernetes_available_upgrades: #{e}"
end
```

#### Using the get_kubernetes_available_upgrades_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetKubernetesAvailableUpgrades200Response>, Integer, Hash)> get_kubernetes_available_upgrades_with_http_info(vke_id)

```ruby
begin
  # Get Kubernetes Available Upgrades
  data, status_code, headers = api_instance.get_kubernetes_available_upgrades_with_http_info(vke_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetKubernetesAvailableUpgrades200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->get_kubernetes_available_upgrades_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vke_id** | **String** | The [VKE ID](#operation/list-kubernetes-clusters). |  |

### Return type

[**GetKubernetesAvailableUpgrades200Response**](GetKubernetesAvailableUpgrades200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_kubernetes_clusters

> <CreateKubernetesCluster201Response> get_kubernetes_clusters(vke_id)

Get Kubernetes Cluster

Get Kubernetes Cluster

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::KubernetesApi.new
vke_id = 'vke_id_example' # String | The [VKE ID](#operation/list-kubernetes-clusters).

begin
  # Get Kubernetes Cluster
  result = api_instance.get_kubernetes_clusters(vke_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->get_kubernetes_clusters: #{e}"
end
```

#### Using the get_kubernetes_clusters_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateKubernetesCluster201Response>, Integer, Hash)> get_kubernetes_clusters_with_http_info(vke_id)

```ruby
begin
  # Get Kubernetes Cluster
  data, status_code, headers = api_instance.get_kubernetes_clusters_with_http_info(vke_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateKubernetesCluster201Response>
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->get_kubernetes_clusters_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vke_id** | **String** | The [VKE ID](#operation/list-kubernetes-clusters). |  |

### Return type

[**CreateKubernetesCluster201Response**](CreateKubernetesCluster201Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_kubernetes_clusters_config

> <GetKubernetesClustersConfig200Response> get_kubernetes_clusters_config(vke_id)

Get Kubernetes Cluster Kubeconfig

Get Kubernetes Cluster Kubeconfig

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::KubernetesApi.new
vke_id = 'vke_id_example' # String | The [VKE ID](#operation/list-kubernetes-clusters).

begin
  # Get Kubernetes Cluster Kubeconfig
  result = api_instance.get_kubernetes_clusters_config(vke_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->get_kubernetes_clusters_config: #{e}"
end
```

#### Using the get_kubernetes_clusters_config_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetKubernetesClustersConfig200Response>, Integer, Hash)> get_kubernetes_clusters_config_with_http_info(vke_id)

```ruby
begin
  # Get Kubernetes Cluster Kubeconfig
  data, status_code, headers = api_instance.get_kubernetes_clusters_config_with_http_info(vke_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetKubernetesClustersConfig200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->get_kubernetes_clusters_config_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vke_id** | **String** | The [VKE ID](#operation/list-kubernetes-clusters). |  |

### Return type

[**GetKubernetesClustersConfig200Response**](GetKubernetesClustersConfig200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_kubernetes_resources

> <GetKubernetesResources200Response> get_kubernetes_resources(vke_id)

Get Kubernetes Resources

Get the block storage volumes and load balancers deployed by the specified Kubernetes cluster.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::KubernetesApi.new
vke_id = 'vke_id_example' # String | The [VKE ID](#operation/list-kubernetes-clusters).

begin
  # Get Kubernetes Resources
  result = api_instance.get_kubernetes_resources(vke_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->get_kubernetes_resources: #{e}"
end
```

#### Using the get_kubernetes_resources_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetKubernetesResources200Response>, Integer, Hash)> get_kubernetes_resources_with_http_info(vke_id)

```ruby
begin
  # Get Kubernetes Resources
  data, status_code, headers = api_instance.get_kubernetes_resources_with_http_info(vke_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetKubernetesResources200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->get_kubernetes_resources_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vke_id** | **String** | The [VKE ID](#operation/list-kubernetes-clusters). |  |

### Return type

[**GetKubernetesResources200Response**](GetKubernetesResources200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_kubernetes_versions

> <GetKubernetesVersions200Response> get_kubernetes_versions

Get Kubernetes Versions

Get a list of supported Kubernetes versions

### Examples

```ruby
require 'time'
require 'vult_ruby'

api_instance = VultRuby::KubernetesApi.new

begin
  # Get Kubernetes Versions
  result = api_instance.get_kubernetes_versions
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->get_kubernetes_versions: #{e}"
end
```

#### Using the get_kubernetes_versions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetKubernetesVersions200Response>, Integer, Hash)> get_kubernetes_versions_with_http_info

```ruby
begin
  # Get Kubernetes Versions
  data, status_code, headers = api_instance.get_kubernetes_versions_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetKubernetesVersions200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->get_kubernetes_versions_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**GetKubernetesVersions200Response**](GetKubernetesVersions200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_nodepool

> <CreateNodepools201Response> get_nodepool(vke_id, nodepool_id)

Get NodePool

Get Nodepool from a Kubernetes Cluster

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::KubernetesApi.new
vke_id = 'vke_id_example' # String | The [VKE ID](#operation/list-kubernetes-clusters).
nodepool_id = 'nodepool_id_example' # String | The [NodePool ID](#operation/get-nodepools).

begin
  # Get NodePool
  result = api_instance.get_nodepool(vke_id, nodepool_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->get_nodepool: #{e}"
end
```

#### Using the get_nodepool_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateNodepools201Response>, Integer, Hash)> get_nodepool_with_http_info(vke_id, nodepool_id)

```ruby
begin
  # Get NodePool
  data, status_code, headers = api_instance.get_nodepool_with_http_info(vke_id, nodepool_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateNodepools201Response>
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->get_nodepool_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vke_id** | **String** | The [VKE ID](#operation/list-kubernetes-clusters). |  |
| **nodepool_id** | **String** | The [NodePool ID](#operation/get-nodepools). |  |

### Return type

[**CreateNodepools201Response**](CreateNodepools201Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_nodepools

> <GetNodepools200Response> get_nodepools(vke_id)

List NodePools

List all available NodePools on a Kubernetes Cluster

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::KubernetesApi.new
vke_id = 'vke_id_example' # String | The [VKE ID](#operation/list-kubernetes-clusters).

begin
  # List NodePools
  result = api_instance.get_nodepools(vke_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->get_nodepools: #{e}"
end
```

#### Using the get_nodepools_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetNodepools200Response>, Integer, Hash)> get_nodepools_with_http_info(vke_id)

```ruby
begin
  # List NodePools
  data, status_code, headers = api_instance.get_nodepools_with_http_info(vke_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetNodepools200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->get_nodepools_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vke_id** | **String** | The [VKE ID](#operation/list-kubernetes-clusters). |  |

### Return type

[**GetNodepools200Response**](GetNodepools200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_kubernetes_clusters

> <ListKubernetesClusters200Response> list_kubernetes_clusters

List all Kubernetes Clusters

List all Kubernetes clusters currently deployed

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::KubernetesApi.new

begin
  # List all Kubernetes Clusters
  result = api_instance.list_kubernetes_clusters
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->list_kubernetes_clusters: #{e}"
end
```

#### Using the list_kubernetes_clusters_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListKubernetesClusters200Response>, Integer, Hash)> list_kubernetes_clusters_with_http_info

```ruby
begin
  # List all Kubernetes Clusters
  data, status_code, headers = api_instance.list_kubernetes_clusters_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListKubernetesClusters200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->list_kubernetes_clusters_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ListKubernetesClusters200Response**](ListKubernetesClusters200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## recycle_nodepool_instance

> recycle_nodepool_instance(vke_id, nodepool_id, node_id)

Recycle a NodePool Instance

Recycle a specific NodePool Instance

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::KubernetesApi.new
vke_id = 'vke_id_example' # String | The [VKE ID](#operation/list-kubernetes-clusters).
nodepool_id = 'nodepool_id_example' # String | The [NodePool ID](#operation/get-nodepools).
node_id = 'node_id_example' # String | Node ID

begin
  # Recycle a NodePool Instance
  api_instance.recycle_nodepool_instance(vke_id, nodepool_id, node_id)
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->recycle_nodepool_instance: #{e}"
end
```

#### Using the recycle_nodepool_instance_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> recycle_nodepool_instance_with_http_info(vke_id, nodepool_id, node_id)

```ruby
begin
  # Recycle a NodePool Instance
  data, status_code, headers = api_instance.recycle_nodepool_instance_with_http_info(vke_id, nodepool_id, node_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->recycle_nodepool_instance_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vke_id** | **String** | The [VKE ID](#operation/list-kubernetes-clusters). |  |
| **nodepool_id** | **String** | The [NodePool ID](#operation/get-nodepools). |  |
| **node_id** | **String** | Node ID |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## start_kubernetes_cluster_upgrade

> start_kubernetes_cluster_upgrade(vke_id, opts)

Start Kubernetes Cluster Upgrade

Start a Kubernetes cluster upgrade.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::KubernetesApi.new
vke_id = 'vke_id_example' # String | The [VKE ID](#operation/list-kubernetes-clusters).
opts = {
  start_kubernetes_cluster_upgrade_request: VultRuby::StartKubernetesClusterUpgradeRequest.new({upgrade_version: 'upgrade_version_example'}) # StartKubernetesClusterUpgradeRequest | Request Body
}

begin
  # Start Kubernetes Cluster Upgrade
  api_instance.start_kubernetes_cluster_upgrade(vke_id, opts)
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->start_kubernetes_cluster_upgrade: #{e}"
end
```

#### Using the start_kubernetes_cluster_upgrade_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> start_kubernetes_cluster_upgrade_with_http_info(vke_id, opts)

```ruby
begin
  # Start Kubernetes Cluster Upgrade
  data, status_code, headers = api_instance.start_kubernetes_cluster_upgrade_with_http_info(vke_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->start_kubernetes_cluster_upgrade_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vke_id** | **String** | The [VKE ID](#operation/list-kubernetes-clusters). |  |
| **start_kubernetes_cluster_upgrade_request** | [**StartKubernetesClusterUpgradeRequest**](StartKubernetesClusterUpgradeRequest.md) | Request Body | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## update_kubernetes_cluster

> update_kubernetes_cluster(vke_id, opts)

Update Kubernetes Cluster

Update Kubernetes Cluster

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::KubernetesApi.new
vke_id = 'vke_id_example' # String | The [VKE ID](#operation/list-kubernetes-clusters).
opts = {
  update_kubernetes_cluster_request: VultRuby::UpdateKubernetesClusterRequest.new({label: 'label_example'}) # UpdateKubernetesClusterRequest | Request Body
}

begin
  # Update Kubernetes Cluster
  api_instance.update_kubernetes_cluster(vke_id, opts)
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->update_kubernetes_cluster: #{e}"
end
```

#### Using the update_kubernetes_cluster_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_kubernetes_cluster_with_http_info(vke_id, opts)

```ruby
begin
  # Update Kubernetes Cluster
  data, status_code, headers = api_instance.update_kubernetes_cluster_with_http_info(vke_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->update_kubernetes_cluster_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vke_id** | **String** | The [VKE ID](#operation/list-kubernetes-clusters). |  |
| **update_kubernetes_cluster_request** | [**UpdateKubernetesClusterRequest**](UpdateKubernetesClusterRequest.md) | Request Body | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## update_nodepool

> <CreateNodepools201Response> update_nodepool(vke_id, nodepool_id, opts)

Update Nodepool

Update a Nodepool on a Kubernetes Cluster

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::KubernetesApi.new
vke_id = 'vke_id_example' # String | The [VKE ID](#operation/list-kubernetes-clusters).
nodepool_id = 'nodepool_id_example' # String | The [NodePool ID](#operation/get-nodepools).
opts = {
  update_nodepool_request: VultRuby::UpdateNodepoolRequest.new # UpdateNodepoolRequest | Request Body
}

begin
  # Update Nodepool
  result = api_instance.update_nodepool(vke_id, nodepool_id, opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->update_nodepool: #{e}"
end
```

#### Using the update_nodepool_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateNodepools201Response>, Integer, Hash)> update_nodepool_with_http_info(vke_id, nodepool_id, opts)

```ruby
begin
  # Update Nodepool
  data, status_code, headers = api_instance.update_nodepool_with_http_info(vke_id, nodepool_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateNodepools201Response>
rescue VultRuby::ApiError => e
  puts "Error when calling KubernetesApi->update_nodepool_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vke_id** | **String** | The [VKE ID](#operation/list-kubernetes-clusters). |  |
| **nodepool_id** | **String** | The [NodePool ID](#operation/get-nodepools). |  |
| **update_nodepool_request** | [**UpdateNodepoolRequest**](UpdateNodepoolRequest.md) | Request Body | [optional] |

### Return type

[**CreateNodepools201Response**](CreateNodepools201Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json, application/xml
- **Accept**: application/json

