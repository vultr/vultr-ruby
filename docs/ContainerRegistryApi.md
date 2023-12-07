# VultRuby::ContainerRegistryApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_registry**](ContainerRegistryApi.md#create_registry) | **POST** /registry | Create Container Registry |
| [**create_registry_docker_credentials**](ContainerRegistryApi.md#create_registry_docker_credentials) | **OPTIONS** /registry/{registry-id}/docker-credentials?expiry_seconds&#x3D;0&amp;read_write&#x3D;false | Create Docker Credentials |
| [**create_registry_kubernetes_docker_credentials**](ContainerRegistryApi.md#create_registry_kubernetes_docker_credentials) | **OPTIONS** /registry/{registry-id}/docker-credentials/kubernetes?expiry_seconds&#x3D;0&amp;read_write&#x3D;false&amp;base64_encode&#x3D;false | Create Docker Credentials for Kubernetes |
| [**delete_registry**](ContainerRegistryApi.md#delete_registry) | **DELETE** /registry/{registry-id} | Delete Container Registry |
| [**delete_repository**](ContainerRegistryApi.md#delete_repository) | **DELETE** /registry/{registry-id}/repository/{repository-image} | Delete Repository |
| [**list_registries**](ContainerRegistryApi.md#list_registries) | **GET** /registries | List Container Registries |
| [**list_registry_plans**](ContainerRegistryApi.md#list_registry_plans) | **GET** /registry/plan/list | List Registry Plans |
| [**list_registry_regions**](ContainerRegistryApi.md#list_registry_regions) | **GET** /registry/region/list | List Registry Regions |
| [**list_registry_repositories**](ContainerRegistryApi.md#list_registry_repositories) | **GET** /registry/{registry-id}/repositories | List Repositories |
| [**read_registry**](ContainerRegistryApi.md#read_registry) | **GET** /registry/{registry-id} | Read Container Registry |
| [**read_registry_repository**](ContainerRegistryApi.md#read_registry_repository) | **GET** /registry/{registry-id}/repository/{repository-image} | Read Repository |
| [**update_registry**](ContainerRegistryApi.md#update_registry) | **PUT** /registry/{registry-id} | Update Container Registry |
| [**update_repository**](ContainerRegistryApi.md#update_repository) | **PUT** /registry/{registry-id}/repository/{repository-image} | Update Repository |


## create_registry

> <Registry> create_registry(opts)

Create Container Registry

Create a new Container Registry Subscription

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ContainerRegistryApi.new
opts = {
  create_registry_request: VultRuby::CreateRegistryRequest.new({name: TODO, public: TODO, region: 'region_example', plan: 'plan_example'}) # CreateRegistryRequest | 
}

begin
  # Create Container Registry
  result = api_instance.create_registry(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->create_registry: #{e}"
end
```

#### Using the create_registry_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Registry>, Integer, Hash)> create_registry_with_http_info(opts)

```ruby
begin
  # Create Container Registry
  data, status_code, headers = api_instance.create_registry_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Registry>
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->create_registry_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_registry_request** | [**CreateRegistryRequest**](CreateRegistryRequest.md) |  | [optional] |

### Return type

[**Registry**](Registry.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_registry_docker_credentials

> <RegistryDockerCredentials> create_registry_docker_credentials(registry_id, opts)

Create Docker Credentials

Create a fresh set of Docker Credentials for this Container Registry Subscription

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ContainerRegistryApi.new
registry_id = 'registry_id_example' # String | The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
opts = {
  expiry_seconds: 56, # Integer | The seconds until these credentials expire. When set to 0, credentials do not expire. The default value is 0
  read_write: true # Boolean | Whether these credentials will have only PULL access or PUSH access as well. If true these credentials can PUSH to repos in this registry. If false, these credentials can only PULL. Default is false.
}

begin
  # Create Docker Credentials
  result = api_instance.create_registry_docker_credentials(registry_id, opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->create_registry_docker_credentials: #{e}"
end
```

#### Using the create_registry_docker_credentials_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<RegistryDockerCredentials>, Integer, Hash)> create_registry_docker_credentials_with_http_info(registry_id, opts)

```ruby
begin
  # Create Docker Credentials
  data, status_code, headers = api_instance.create_registry_docker_credentials_with_http_info(registry_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <RegistryDockerCredentials>
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->create_registry_docker_credentials_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **registry_id** | **String** | The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries). |  |
| **expiry_seconds** | **Integer** | The seconds until these credentials expire. When set to 0, credentials do not expire. The default value is 0 | [optional] |
| **read_write** | **Boolean** | Whether these credentials will have only PULL access or PUSH access as well. If true these credentials can PUSH to repos in this registry. If false, these credentials can only PULL. Default is false. | [optional] |

### Return type

[**RegistryDockerCredentials**](RegistryDockerCredentials.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## create_registry_kubernetes_docker_credentials

> <RegistryKubernetesDockerCredentials> create_registry_kubernetes_docker_credentials(registry_id, opts)

Create Docker Credentials for Kubernetes

Create a fresh set of Docker Credentials for this Container Registry Subscription and return them in a Kubernetes friendly YAML format

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ContainerRegistryApi.new
registry_id = 'registry_id_example' # String | The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
opts = {
  expiry_seconds: 56, # Integer | The seconds until these credentials expire. When set to 0, credentials do not expire. The default value is 0
  read_write: true, # Boolean | Whether these credentials will have only PULL access or PUSH access as well. If true these credentials can PUSH to repos in this registry. If false, these credentials can only PULL. Default is false.
  base64_encode: true # Boolean | Whether this YAML will be returned in a base64 encoded string for ease of downloading. If true, the response will be a base64 encoded string. Default is false.
}

begin
  # Create Docker Credentials for Kubernetes
  result = api_instance.create_registry_kubernetes_docker_credentials(registry_id, opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->create_registry_kubernetes_docker_credentials: #{e}"
end
```

#### Using the create_registry_kubernetes_docker_credentials_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<RegistryKubernetesDockerCredentials>, Integer, Hash)> create_registry_kubernetes_docker_credentials_with_http_info(registry_id, opts)

```ruby
begin
  # Create Docker Credentials for Kubernetes
  data, status_code, headers = api_instance.create_registry_kubernetes_docker_credentials_with_http_info(registry_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <RegistryKubernetesDockerCredentials>
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->create_registry_kubernetes_docker_credentials_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **registry_id** | **String** | The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries). |  |
| **expiry_seconds** | **Integer** | The seconds until these credentials expire. When set to 0, credentials do not expire. The default value is 0 | [optional] |
| **read_write** | **Boolean** | Whether these credentials will have only PULL access or PUSH access as well. If true these credentials can PUSH to repos in this registry. If false, these credentials can only PULL. Default is false. | [optional] |
| **base64_encode** | **Boolean** | Whether this YAML will be returned in a base64 encoded string for ease of downloading. If true, the response will be a base64 encoded string. Default is false. | [optional] |

### Return type

[**RegistryKubernetesDockerCredentials**](RegistryKubernetesDockerCredentials.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/yaml


## delete_registry

> delete_registry(registry_id)

Delete Container Registry

Deletes a Container Registry Subscription

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ContainerRegistryApi.new
registry_id = 'registry_id_example' # String | The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).

begin
  # Delete Container Registry
  api_instance.delete_registry(registry_id)
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->delete_registry: #{e}"
end
```

#### Using the delete_registry_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_registry_with_http_info(registry_id)

```ruby
begin
  # Delete Container Registry
  data, status_code, headers = api_instance.delete_registry_with_http_info(registry_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->delete_registry_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **registry_id** | **String** | The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## delete_repository

> delete_repository(registry_id, repository_image)

Delete Repository

Deletes a Repository from a Container Registry Subscription

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ContainerRegistryApi.new
registry_id = 'registry_id_example' # String | The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
repository_image = 'repository_image_example' # String | The [Repository Image](#components/schemas/registry-repository/properties/image). Which can be found by [List Repositories](#operation/list-registry-repositories).

begin
  # Delete Repository
  api_instance.delete_repository(registry_id, repository_image)
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->delete_repository: #{e}"
end
```

#### Using the delete_repository_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_repository_with_http_info(registry_id, repository_image)

```ruby
begin
  # Delete Repository
  data, status_code, headers = api_instance.delete_repository_with_http_info(registry_id, repository_image)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->delete_repository_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **registry_id** | **String** | The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries). |  |
| **repository_image** | **String** | The [Repository Image](#components/schemas/registry-repository/properties/image). Which can be found by [List Repositories](#operation/list-registry-repositories). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## list_registries

> <ListRegistries200Response> list_registries

List Container Registries

List All Container Registry Subscriptions for this account

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ContainerRegistryApi.new

begin
  # List Container Registries
  result = api_instance.list_registries
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->list_registries: #{e}"
end
```

#### Using the list_registries_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListRegistries200Response>, Integer, Hash)> list_registries_with_http_info

```ruby
begin
  # List Container Registries
  data, status_code, headers = api_instance.list_registries_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListRegistries200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->list_registries_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ListRegistries200Response**](ListRegistries200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_registry_plans

> <ListRegistryPlans200Response> list_registry_plans

List Registry Plans

List All Plans to help choose which one is the best fit for your Container Registry

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ContainerRegistryApi.new

begin
  # List Registry Plans
  result = api_instance.list_registry_plans
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->list_registry_plans: #{e}"
end
```

#### Using the list_registry_plans_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListRegistryPlans200Response>, Integer, Hash)> list_registry_plans_with_http_info

```ruby
begin
  # List Registry Plans
  data, status_code, headers = api_instance.list_registry_plans_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListRegistryPlans200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->list_registry_plans_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ListRegistryPlans200Response**](ListRegistryPlans200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_registry_regions

> <ListRegistryRegions200Response> list_registry_regions

List Registry Regions

List All Regions where a Container Registry can be deployed

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ContainerRegistryApi.new

begin
  # List Registry Regions
  result = api_instance.list_registry_regions
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->list_registry_regions: #{e}"
end
```

#### Using the list_registry_regions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListRegistryRegions200Response>, Integer, Hash)> list_registry_regions_with_http_info

```ruby
begin
  # List Registry Regions
  data, status_code, headers = api_instance.list_registry_regions_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListRegistryRegions200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->list_registry_regions_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ListRegistryRegions200Response**](ListRegistryRegions200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_registry_repositories

> <ListRegistryRepositories200Response> list_registry_repositories(registry_id)

List Repositories

List All Repositories in a Container Registry Subscription

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ContainerRegistryApi.new
registry_id = 'registry_id_example' # String | The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).

begin
  # List Repositories
  result = api_instance.list_registry_repositories(registry_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->list_registry_repositories: #{e}"
end
```

#### Using the list_registry_repositories_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListRegistryRepositories200Response>, Integer, Hash)> list_registry_repositories_with_http_info(registry_id)

```ruby
begin
  # List Repositories
  data, status_code, headers = api_instance.list_registry_repositories_with_http_info(registry_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListRegistryRepositories200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->list_registry_repositories_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **registry_id** | **String** | The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries). |  |

### Return type

[**ListRegistryRepositories200Response**](ListRegistryRepositories200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## read_registry

> <Registry> read_registry(registry_id)

Read Container Registry

Get a single Container Registry Subscription

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ContainerRegistryApi.new
registry_id = 'registry_id_example' # String | The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).

begin
  # Read Container Registry
  result = api_instance.read_registry(registry_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->read_registry: #{e}"
end
```

#### Using the read_registry_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Registry>, Integer, Hash)> read_registry_with_http_info(registry_id)

```ruby
begin
  # Read Container Registry
  data, status_code, headers = api_instance.read_registry_with_http_info(registry_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Registry>
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->read_registry_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **registry_id** | **String** | The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries). |  |

### Return type

[**Registry**](Registry.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## read_registry_repository

> <RegistryRepository> read_registry_repository(registry_id, repository_image)

Read Repository

Get a single Repository in a Container Registry Subscription

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ContainerRegistryApi.new
registry_id = 'registry_id_example' # String | The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
repository_image = 'repository_image_example' # String | The [Repository Image](#components/schemas/registry-repository/properties/image). Which can be found by [List Repositories](#operation/list-registry-repositories).

begin
  # Read Repository
  result = api_instance.read_registry_repository(registry_id, repository_image)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->read_registry_repository: #{e}"
end
```

#### Using the read_registry_repository_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<RegistryRepository>, Integer, Hash)> read_registry_repository_with_http_info(registry_id, repository_image)

```ruby
begin
  # Read Repository
  data, status_code, headers = api_instance.read_registry_repository_with_http_info(registry_id, repository_image)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <RegistryRepository>
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->read_registry_repository_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **registry_id** | **String** | The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries). |  |
| **repository_image** | **String** | The [Repository Image](#components/schemas/registry-repository/properties/image). Which can be found by [List Repositories](#operation/list-registry-repositories). |  |

### Return type

[**RegistryRepository**](RegistryRepository.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_registry

> <Registry> update_registry(registry_id, opts)

Update Container Registry

Update a Container Registry Subscription

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ContainerRegistryApi.new
registry_id = 'registry_id_example' # String | The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
opts = {
  update_registry_request: VultRuby::UpdateRegistryRequest.new # UpdateRegistryRequest | 
}

begin
  # Update Container Registry
  result = api_instance.update_registry(registry_id, opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->update_registry: #{e}"
end
```

#### Using the update_registry_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Registry>, Integer, Hash)> update_registry_with_http_info(registry_id, opts)

```ruby
begin
  # Update Container Registry
  data, status_code, headers = api_instance.update_registry_with_http_info(registry_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Registry>
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->update_registry_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **registry_id** | **String** | The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries). |  |
| **update_registry_request** | [**UpdateRegistryRequest**](UpdateRegistryRequest.md) |  | [optional] |

### Return type

[**Registry**](Registry.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_repository

> <RegistryRepository> update_repository(registry_id, repository_image, opts)

Update Repository

Update a Repository in a Container Registry Subscription

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::ContainerRegistryApi.new
registry_id = 'registry_id_example' # String | The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
repository_image = 'repository_image_example' # String | The [Repository Image](#components/schemas/registry-repository/properties/image). Which can be found by [List Repositories](#operation/list-registry-repositories).
opts = {
  update_repository_request: VultRuby::UpdateRepositoryRequest.new # UpdateRepositoryRequest | 
}

begin
  # Update Repository
  result = api_instance.update_repository(registry_id, repository_image, opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->update_repository: #{e}"
end
```

#### Using the update_repository_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<RegistryRepository>, Integer, Hash)> update_repository_with_http_info(registry_id, repository_image, opts)

```ruby
begin
  # Update Repository
  data, status_code, headers = api_instance.update_repository_with_http_info(registry_id, repository_image, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <RegistryRepository>
rescue VultRuby::ApiError => e
  puts "Error when calling ContainerRegistryApi->update_repository_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **registry_id** | **String** | The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries). |  |
| **repository_image** | **String** | The [Repository Image](#components/schemas/registry-repository/properties/image). Which can be found by [List Repositories](#operation/list-registry-repositories). |  |
| **update_repository_request** | [**UpdateRepositoryRequest**](UpdateRepositoryRequest.md) |  | [optional] |

### Return type

[**RegistryRepository**](RegistryRepository.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

