# VultrRuby::InstancesApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**attach_instance_iso**](InstancesApi.md#attach_instance_iso) | **POST** /instances/{instance-id}/iso/attach | Attach ISO to Instance |
| [**attach_instance_network**](InstancesApi.md#attach_instance_network) | **POST** /instances/{instance-id}/private-networks/attach | Attach Private Network to Instance |
| [**attach_instance_vpc**](InstancesApi.md#attach_instance_vpc) | **POST** /instances/{instance-id}/vpcs/attach | Attach VPC to Instance |
| [**attach_instance_vpc2**](InstancesApi.md#attach_instance_vpc2) | **POST** /instances/{instance-id}/vpc2/attach | Attach VPC 2.0 Network to Instance |
| [**create_instance**](InstancesApi.md#create_instance) | **POST** /instances | Create Instance |
| [**create_instance_backup_schedule**](InstancesApi.md#create_instance_backup_schedule) | **POST** /instances/{instance-id}/backup-schedule | Set Instance Backup Schedule |
| [**create_instance_ipv4**](InstancesApi.md#create_instance_ipv4) | **POST** /instances/{instance-id}/ipv4 | Create IPv4 |
| [**create_instance_reverse_ipv4**](InstancesApi.md#create_instance_reverse_ipv4) | **POST** /instances/{instance-id}/ipv4/reverse | Create Instance Reverse IPv4 |
| [**create_instance_reverse_ipv6**](InstancesApi.md#create_instance_reverse_ipv6) | **POST** /instances/{instance-id}/ipv6/reverse | Create Instance Reverse IPv6 |
| [**delete_instance**](InstancesApi.md#delete_instance) | **DELETE** /instances/{instance-id} | Delete Instance |
| [**delete_instance_ipv4**](InstancesApi.md#delete_instance_ipv4) | **DELETE** /instances/{instance-id}/ipv4/{ipv4} | Delete IPv4 Address |
| [**delete_instance_reverse_ipv6**](InstancesApi.md#delete_instance_reverse_ipv6) | **DELETE** /instances/{instance-id}/ipv6/reverse/{ipv6} | Delete Instance Reverse IPv6 |
| [**detach_instance_iso**](InstancesApi.md#detach_instance_iso) | **POST** /instances/{instance-id}/iso/detach | Detach ISO from instance |
| [**detach_instance_network**](InstancesApi.md#detach_instance_network) | **POST** /instances/{instance-id}/private-networks/detach | Detach Private Network from Instance. |
| [**detach_instance_vpc**](InstancesApi.md#detach_instance_vpc) | **POST** /instances/{instance-id}/vpcs/detach | Detach VPC from Instance |
| [**detach_instance_vpc2**](InstancesApi.md#detach_instance_vpc2) | **POST** /instances/{instance-id}/vpc2/detach | Detach VPC 2.0 Network from Instance |
| [**get_instance**](InstancesApi.md#get_instance) | **GET** /instances/{instance-id} | Get Instance |
| [**get_instance_backup_schedule**](InstancesApi.md#get_instance_backup_schedule) | **GET** /instances/{instance-id}/backup-schedule | Get Instance Backup Schedule |
| [**get_instance_bandwidth**](InstancesApi.md#get_instance_bandwidth) | **GET** /instances/{instance-id}/bandwidth | Instance Bandwidth |
| [**get_instance_ipv4**](InstancesApi.md#get_instance_ipv4) | **GET** /instances/{instance-id}/ipv4 | List Instance IPv4 Information |
| [**get_instance_ipv6**](InstancesApi.md#get_instance_ipv6) | **GET** /instances/{instance-id}/ipv6 | Get Instance IPv6 Information |
| [**get_instance_iso_status**](InstancesApi.md#get_instance_iso_status) | **GET** /instances/{instance-id}/iso | Get Instance ISO Status |
| [**get_instance_neighbors**](InstancesApi.md#get_instance_neighbors) | **GET** /instances/{instance-id}/neighbors | Get Instance neighbors |
| [**get_instance_upgrades**](InstancesApi.md#get_instance_upgrades) | **GET** /instances/{instance-id}/upgrades | Get Available Instance Upgrades |
| [**get_instance_userdata**](InstancesApi.md#get_instance_userdata) | **GET** /instances/{instance-id}/user-data | Get Instance User Data |
| [**halt_instance**](InstancesApi.md#halt_instance) | **POST** /instances/{instance-id}/halt | Halt Instance |
| [**halt_instances**](InstancesApi.md#halt_instances) | **POST** /instances/halt | Halt Instances |
| [**list_instance_ipv6_reverse**](InstancesApi.md#list_instance_ipv6_reverse) | **GET** /instances/{instance-id}/ipv6/reverse | List Instance IPv6 Reverse |
| [**list_instance_private_networks**](InstancesApi.md#list_instance_private_networks) | **GET** /instances/{instance-id}/private-networks | List instance Private Networks |
| [**list_instance_vpc2**](InstancesApi.md#list_instance_vpc2) | **GET** /instances/{instance-id}/vpc2 | List Instance VPC 2.0 Networks |
| [**list_instance_vpcs**](InstancesApi.md#list_instance_vpcs) | **GET** /instances/{instance-id}/vpcs | List instance VPCs |
| [**list_instances**](InstancesApi.md#list_instances) | **GET** /instances | List Instances |
| [**post_instances_instance_id_ipv4_reverse_default**](InstancesApi.md#post_instances_instance_id_ipv4_reverse_default) | **POST** /instances/{instance-id}/ipv4/reverse/default | Set Default Reverse DNS Entry |
| [**reboot_instance**](InstancesApi.md#reboot_instance) | **POST** /instances/{instance-id}/reboot | Reboot Instance |
| [**reboot_instances**](InstancesApi.md#reboot_instances) | **POST** /instances/reboot | Reboot instances |
| [**reinstall_instance**](InstancesApi.md#reinstall_instance) | **POST** /instances/{instance-id}/reinstall | Reinstall Instance |
| [**restore_instance**](InstancesApi.md#restore_instance) | **POST** /instances/{instance-id}/restore | Restore Instance |
| [**start_instance**](InstancesApi.md#start_instance) | **POST** /instances/{instance-id}/start | Start instance |
| [**start_instances**](InstancesApi.md#start_instances) | **POST** /instances/start | Start instances |
| [**update_instance**](InstancesApi.md#update_instance) | **PATCH** /instances/{instance-id} | Update Instance |


## attach_instance_iso

> <AttachInstanceIso202Response> attach_instance_iso(instance_id, opts)

Attach ISO to Instance

Attach an ISO to an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | 
opts = {
  attach_instance_iso_request: VultrRuby::AttachInstanceIsoRequest.new # AttachInstanceIsoRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Attach ISO to Instance
  result = api_instance.attach_instance_iso(instance_id, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->attach_instance_iso: #{e}"
end
```

#### Using the attach_instance_iso_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AttachInstanceIso202Response>, Integer, Hash)> attach_instance_iso_with_http_info(instance_id, opts)

```ruby
begin
  # Attach ISO to Instance
  data, status_code, headers = api_instance.attach_instance_iso_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AttachInstanceIso202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->attach_instance_iso_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** |  |  |
| **attach_instance_iso_request** | [**AttachInstanceIsoRequest**](AttachInstanceIsoRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**AttachInstanceIso202Response**](AttachInstanceIso202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## attach_instance_network

> attach_instance_network(instance_id, opts)

Attach Private Network to Instance

Attach Private Network to an Instance.<br><br>**Deprecated**: use [Attach VPC to Instance](#operation/attach-instance-vpc) instead.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  attach_instance_network_request: VultrRuby::AttachInstanceNetworkRequest.new # AttachInstanceNetworkRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Attach Private Network to Instance
  api_instance.attach_instance_network(instance_id, opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->attach_instance_network: #{e}"
end
```

#### Using the attach_instance_network_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> attach_instance_network_with_http_info(instance_id, opts)

```ruby
begin
  # Attach Private Network to Instance
  data, status_code, headers = api_instance.attach_instance_network_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->attach_instance_network_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **attach_instance_network_request** | [**AttachInstanceNetworkRequest**](AttachInstanceNetworkRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## attach_instance_vpc

> attach_instance_vpc(instance_id, opts)

Attach VPC to Instance

Attach a VPC to an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  attach_instance_vpc_request: VultrRuby::AttachInstanceVpcRequest.new # AttachInstanceVpcRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Attach VPC to Instance
  api_instance.attach_instance_vpc(instance_id, opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->attach_instance_vpc: #{e}"
end
```

#### Using the attach_instance_vpc_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> attach_instance_vpc_with_http_info(instance_id, opts)

```ruby
begin
  # Attach VPC to Instance
  data, status_code, headers = api_instance.attach_instance_vpc_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->attach_instance_vpc_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **attach_instance_vpc_request** | [**AttachInstanceVpcRequest**](AttachInstanceVpcRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## attach_instance_vpc2

> attach_instance_vpc2(instance_id, opts)

Attach VPC 2.0 Network to Instance

Attach a VPC 2.0 Network to an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  attach_instance_vpc2_request: VultrRuby::AttachInstanceVpc2Request.new({vpc_id: 'vpc_id_example'}) # AttachInstanceVpc2Request | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Attach VPC 2.0 Network to Instance
  api_instance.attach_instance_vpc2(instance_id, opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->attach_instance_vpc2: #{e}"
end
```

#### Using the attach_instance_vpc2_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> attach_instance_vpc2_with_http_info(instance_id, opts)

```ruby
begin
  # Attach VPC 2.0 Network to Instance
  data, status_code, headers = api_instance.attach_instance_vpc2_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->attach_instance_vpc2_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **attach_instance_vpc2_request** | [**AttachInstanceVpc2Request**](AttachInstanceVpc2Request.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## create_instance

> <CreateInstance202Response> create_instance(opts)

Create Instance

Create a new VPS Instance in a `region` with the desired `plan`. Choose one of the following to deploy the instance:  * `os_id` * `iso_id` * `snapshot_id` * `app_id` * `image_id`  Supply other attributes as desired.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
opts = {
  create_instance_request: VultrRuby::CreateInstanceRequest.new({region: 'region_example', plan: 'plan_example'}) # CreateInstanceRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Instance
  result = api_instance.create_instance(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->create_instance: #{e}"
end
```

#### Using the create_instance_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateInstance202Response>, Integer, Hash)> create_instance_with_http_info(opts)

```ruby
begin
  # Create Instance
  data, status_code, headers = api_instance.create_instance_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateInstance202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->create_instance_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_instance_request** | [**CreateInstanceRequest**](CreateInstanceRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateInstance202Response**](CreateInstance202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_instance_backup_schedule

> create_instance_backup_schedule(instance_id, opts)

Set Instance Backup Schedule

Set the backup schedule for an Instance in UTC. The `type` is required.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  create_instance_backup_schedule_request: VultrRuby::CreateInstanceBackupScheduleRequest.new({type: 'type_example'}) # CreateInstanceBackupScheduleRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Set Instance Backup Schedule
  api_instance.create_instance_backup_schedule(instance_id, opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->create_instance_backup_schedule: #{e}"
end
```

#### Using the create_instance_backup_schedule_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> create_instance_backup_schedule_with_http_info(instance_id, opts)

```ruby
begin
  # Set Instance Backup Schedule
  data, status_code, headers = api_instance.create_instance_backup_schedule_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->create_instance_backup_schedule_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **create_instance_backup_schedule_request** | [**CreateInstanceBackupScheduleRequest**](CreateInstanceBackupScheduleRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## create_instance_ipv4

> Object create_instance_ipv4(instance_id, opts)

Create IPv4

Create an IPv4 address for an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  create_instance_ipv4_request: VultrRuby::CreateInstanceIpv4Request.new # CreateInstanceIpv4Request | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create IPv4
  result = api_instance.create_instance_ipv4(instance_id, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->create_instance_ipv4: #{e}"
end
```

#### Using the create_instance_ipv4_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> create_instance_ipv4_with_http_info(instance_id, opts)

```ruby
begin
  # Create IPv4
  data, status_code, headers = api_instance.create_instance_ipv4_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->create_instance_ipv4_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **create_instance_ipv4_request** | [**CreateInstanceIpv4Request**](CreateInstanceIpv4Request.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

**Object**

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_instance_reverse_ipv4

> create_instance_reverse_ipv4(instance_id, opts)

Create Instance Reverse IPv4

Create a reverse IPv4 entry for an Instance. The `ip` and `reverse` attributes are required. 

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  create_instance_reverse_ipv4_request: VultrRuby::CreateInstanceReverseIpv4Request.new({ip: 'ip_example', reverse: 'reverse_example'}) # CreateInstanceReverseIpv4Request | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Instance Reverse IPv4
  api_instance.create_instance_reverse_ipv4(instance_id, opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->create_instance_reverse_ipv4: #{e}"
end
```

#### Using the create_instance_reverse_ipv4_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> create_instance_reverse_ipv4_with_http_info(instance_id, opts)

```ruby
begin
  # Create Instance Reverse IPv4
  data, status_code, headers = api_instance.create_instance_reverse_ipv4_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->create_instance_reverse_ipv4_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **create_instance_reverse_ipv4_request** | [**CreateInstanceReverseIpv4Request**](CreateInstanceReverseIpv4Request.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## create_instance_reverse_ipv6

> create_instance_reverse_ipv6(instance_id, opts)

Create Instance Reverse IPv6

Create a reverse IPv6 entry for an Instance. The `ip` and `reverse` attributes are required. IP address must be in full, expanded format.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  create_instance_reverse_ipv6_request: VultrRuby::CreateInstanceReverseIpv6Request.new({ip: 'ip_example', reverse: 'reverse_example'}) # CreateInstanceReverseIpv6Request | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Instance Reverse IPv6
  api_instance.create_instance_reverse_ipv6(instance_id, opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->create_instance_reverse_ipv6: #{e}"
end
```

#### Using the create_instance_reverse_ipv6_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> create_instance_reverse_ipv6_with_http_info(instance_id, opts)

```ruby
begin
  # Create Instance Reverse IPv6
  data, status_code, headers = api_instance.create_instance_reverse_ipv6_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->create_instance_reverse_ipv6_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **create_instance_reverse_ipv6_request** | [**CreateInstanceReverseIpv6Request**](CreateInstanceReverseIpv6Request.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## delete_instance

> delete_instance(instance_id)

Delete Instance

Delete an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).

begin
  # Delete Instance
  api_instance.delete_instance(instance_id)
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->delete_instance: #{e}"
end
```

#### Using the delete_instance_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_instance_with_http_info(instance_id)

```ruby
begin
  # Delete Instance
  data, status_code, headers = api_instance.delete_instance_with_http_info(instance_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->delete_instance_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## delete_instance_ipv4

> delete_instance_ipv4(instance_id, ipv4)

Delete IPv4 Address

Delete an IPv4 address from an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
ipv4 = 'ipv4_example' # String | The IPv4 address.

begin
  # Delete IPv4 Address
  api_instance.delete_instance_ipv4(instance_id, ipv4)
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->delete_instance_ipv4: #{e}"
end
```

#### Using the delete_instance_ipv4_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_instance_ipv4_with_http_info(instance_id, ipv4)

```ruby
begin
  # Delete IPv4 Address
  data, status_code, headers = api_instance.delete_instance_ipv4_with_http_info(instance_id, ipv4)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->delete_instance_ipv4_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **ipv4** | **String** | The IPv4 address. |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## delete_instance_reverse_ipv6

> delete_instance_reverse_ipv6(instance_id, ipv6)

Delete Instance Reverse IPv6

Delete the reverse IPv6 for an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
ipv6 = 'ipv6_example' # String | The IPv6 address.

begin
  # Delete Instance Reverse IPv6
  api_instance.delete_instance_reverse_ipv6(instance_id, ipv6)
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->delete_instance_reverse_ipv6: #{e}"
end
```

#### Using the delete_instance_reverse_ipv6_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_instance_reverse_ipv6_with_http_info(instance_id, ipv6)

```ruby
begin
  # Delete Instance Reverse IPv6
  data, status_code, headers = api_instance.delete_instance_reverse_ipv6_with_http_info(instance_id, ipv6)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->delete_instance_reverse_ipv6_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **ipv6** | **String** | The IPv6 address. |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## detach_instance_iso

> <DetachInstanceIso202Response> detach_instance_iso(instance_id)

Detach ISO from instance

Detach the ISO from an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).

begin
  # Detach ISO from instance
  result = api_instance.detach_instance_iso(instance_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->detach_instance_iso: #{e}"
end
```

#### Using the detach_instance_iso_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DetachInstanceIso202Response>, Integer, Hash)> detach_instance_iso_with_http_info(instance_id)

```ruby
begin
  # Detach ISO from instance
  data, status_code, headers = api_instance.detach_instance_iso_with_http_info(instance_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DetachInstanceIso202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->detach_instance_iso_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |

### Return type

[**DetachInstanceIso202Response**](DetachInstanceIso202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## detach_instance_network

> detach_instance_network(instance_id, opts)

Detach Private Network from Instance.

Detach Private Network from an Instance.<br><br>**Deprecated**: use [Detach VPC from Instance](#operation/detach-instance-vpc) instead.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  detach_instance_network_request: VultrRuby::DetachInstanceNetworkRequest.new # DetachInstanceNetworkRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Detach Private Network from Instance.
  api_instance.detach_instance_network(instance_id, opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->detach_instance_network: #{e}"
end
```

#### Using the detach_instance_network_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> detach_instance_network_with_http_info(instance_id, opts)

```ruby
begin
  # Detach Private Network from Instance.
  data, status_code, headers = api_instance.detach_instance_network_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->detach_instance_network_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **detach_instance_network_request** | [**DetachInstanceNetworkRequest**](DetachInstanceNetworkRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## detach_instance_vpc

> detach_instance_vpc(instance_id, opts)

Detach VPC from Instance

Detach a VPC from an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  detach_instance_vpc_request: VultrRuby::DetachInstanceVpcRequest.new # DetachInstanceVpcRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Detach VPC from Instance
  api_instance.detach_instance_vpc(instance_id, opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->detach_instance_vpc: #{e}"
end
```

#### Using the detach_instance_vpc_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> detach_instance_vpc_with_http_info(instance_id, opts)

```ruby
begin
  # Detach VPC from Instance
  data, status_code, headers = api_instance.detach_instance_vpc_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->detach_instance_vpc_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **detach_instance_vpc_request** | [**DetachInstanceVpcRequest**](DetachInstanceVpcRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## detach_instance_vpc2

> detach_instance_vpc2(instance_id, opts)

Detach VPC 2.0 Network from Instance

Detach a VPC 2.0 Network from an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  detach_instance_vpc2_request: VultrRuby::DetachInstanceVpc2Request.new({vpc_id: 'vpc_id_example'}) # DetachInstanceVpc2Request | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Detach VPC 2.0 Network from Instance
  api_instance.detach_instance_vpc2(instance_id, opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->detach_instance_vpc2: #{e}"
end
```

#### Using the detach_instance_vpc2_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> detach_instance_vpc2_with_http_info(instance_id, opts)

```ruby
begin
  # Detach VPC 2.0 Network from Instance
  data, status_code, headers = api_instance.detach_instance_vpc2_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->detach_instance_vpc2_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **detach_instance_vpc2_request** | [**DetachInstanceVpc2Request**](DetachInstanceVpc2Request.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## get_instance

> <CreateInstance202Response> get_instance(instance_id)

Get Instance

Get information about an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).

begin
  # Get Instance
  result = api_instance.get_instance(instance_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->get_instance: #{e}"
end
```

#### Using the get_instance_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateInstance202Response>, Integer, Hash)> get_instance_with_http_info(instance_id)

```ruby
begin
  # Get Instance
  data, status_code, headers = api_instance.get_instance_with_http_info(instance_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateInstance202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->get_instance_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |

### Return type

[**CreateInstance202Response**](CreateInstance202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_instance_backup_schedule

> <GetInstanceBackupSchedule200Response> get_instance_backup_schedule(instance_id)

Get Instance Backup Schedule

Get the backup schedule for an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).

begin
  # Get Instance Backup Schedule
  result = api_instance.get_instance_backup_schedule(instance_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->get_instance_backup_schedule: #{e}"
end
```

#### Using the get_instance_backup_schedule_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetInstanceBackupSchedule200Response>, Integer, Hash)> get_instance_backup_schedule_with_http_info(instance_id)

```ruby
begin
  # Get Instance Backup Schedule
  data, status_code, headers = api_instance.get_instance_backup_schedule_with_http_info(instance_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetInstanceBackupSchedule200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->get_instance_backup_schedule_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |

### Return type

[**GetInstanceBackupSchedule200Response**](GetInstanceBackupSchedule200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_instance_bandwidth

> <GetBandwidthBaremetal200Response> get_instance_bandwidth(instance_id, opts)

Instance Bandwidth

Get bandwidth information about an Instance.<br><br>The `bandwidth` object in a successful response contains objects representing a day in the month. The date is denoted by the nested object keys. Days begin and end in the UTC timezone. The bandwidth utilization data contained within the date object is refreshed periodically. We do not recommend using this endpoint to gather real-time metrics.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  date_range: 56 # Integer | The range of days to include, represented as the number of days relative to the current date. Default 30, Minimum 1 and Max 60.
}

begin
  # Instance Bandwidth
  result = api_instance.get_instance_bandwidth(instance_id, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->get_instance_bandwidth: #{e}"
end
```

#### Using the get_instance_bandwidth_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetBandwidthBaremetal200Response>, Integer, Hash)> get_instance_bandwidth_with_http_info(instance_id, opts)

```ruby
begin
  # Instance Bandwidth
  data, status_code, headers = api_instance.get_instance_bandwidth_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetBandwidthBaremetal200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->get_instance_bandwidth_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **date_range** | **Integer** | The range of days to include, represented as the number of days relative to the current date. Default 30, Minimum 1 and Max 60. | [optional] |

### Return type

[**GetBandwidthBaremetal200Response**](GetBandwidthBaremetal200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_instance_ipv4

> <GetIpv4Baremetal200Response> get_instance_ipv4(instance_id, opts)

List Instance IPv4 Information

List the IPv4 information for an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  public_network: true, # Boolean | If `true`, includes information about the public network adapter (such as MAC address) with the `main_ip` entry.
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500. 
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Instance IPv4 Information
  result = api_instance.get_instance_ipv4(instance_id, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->get_instance_ipv4: #{e}"
end
```

#### Using the get_instance_ipv4_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetIpv4Baremetal200Response>, Integer, Hash)> get_instance_ipv4_with_http_info(instance_id, opts)

```ruby
begin
  # List Instance IPv4 Information
  data, status_code, headers = api_instance.get_instance_ipv4_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetIpv4Baremetal200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->get_instance_ipv4_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **public_network** | **Boolean** | If &#x60;true&#x60;, includes information about the public network adapter (such as MAC address) with the &#x60;main_ip&#x60; entry. | [optional] |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500.  | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**GetIpv4Baremetal200Response**](GetIpv4Baremetal200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_instance_ipv6

> <GetIpv6Baremetal200Response> get_instance_ipv6(instance_id)

Get Instance IPv6 Information

Get the IPv6 information for an VPS Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).

begin
  # Get Instance IPv6 Information
  result = api_instance.get_instance_ipv6(instance_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->get_instance_ipv6: #{e}"
end
```

#### Using the get_instance_ipv6_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetIpv6Baremetal200Response>, Integer, Hash)> get_instance_ipv6_with_http_info(instance_id)

```ruby
begin
  # Get Instance IPv6 Information
  data, status_code, headers = api_instance.get_instance_ipv6_with_http_info(instance_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetIpv6Baremetal200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->get_instance_ipv6_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |

### Return type

[**GetIpv6Baremetal200Response**](GetIpv6Baremetal200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_instance_iso_status

> <GetInstanceIsoStatus200Response> get_instance_iso_status(instance_id)

Get Instance ISO Status

Get the ISO status for an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).

begin
  # Get Instance ISO Status
  result = api_instance.get_instance_iso_status(instance_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->get_instance_iso_status: #{e}"
end
```

#### Using the get_instance_iso_status_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetInstanceIsoStatus200Response>, Integer, Hash)> get_instance_iso_status_with_http_info(instance_id)

```ruby
begin
  # Get Instance ISO Status
  data, status_code, headers = api_instance.get_instance_iso_status_with_http_info(instance_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetInstanceIsoStatus200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->get_instance_iso_status_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |

### Return type

[**GetInstanceIsoStatus200Response**](GetInstanceIsoStatus200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_instance_neighbors

> <GetInstanceNeighbors200Response> get_instance_neighbors(instance_id)

Get Instance neighbors

Get a list of other instances in the same location as this Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).

begin
  # Get Instance neighbors
  result = api_instance.get_instance_neighbors(instance_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->get_instance_neighbors: #{e}"
end
```

#### Using the get_instance_neighbors_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetInstanceNeighbors200Response>, Integer, Hash)> get_instance_neighbors_with_http_info(instance_id)

```ruby
begin
  # Get Instance neighbors
  data, status_code, headers = api_instance.get_instance_neighbors_with_http_info(instance_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetInstanceNeighbors200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->get_instance_neighbors_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |

### Return type

[**GetInstanceNeighbors200Response**](GetInstanceNeighbors200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_instance_upgrades

> <GetInstanceUpgrades200Response> get_instance_upgrades(instance_id, opts)

Get Available Instance Upgrades

Get available upgrades for an Instance

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  type: 'type_example' # String | Filter upgrade by type:  - all (applications, os, plans) - applications - os - plans
}

begin
  # Get Available Instance Upgrades
  result = api_instance.get_instance_upgrades(instance_id, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->get_instance_upgrades: #{e}"
end
```

#### Using the get_instance_upgrades_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetInstanceUpgrades200Response>, Integer, Hash)> get_instance_upgrades_with_http_info(instance_id, opts)

```ruby
begin
  # Get Available Instance Upgrades
  data, status_code, headers = api_instance.get_instance_upgrades_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetInstanceUpgrades200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->get_instance_upgrades_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **type** | **String** | Filter upgrade by type:  - all (applications, os, plans) - applications - os - plans | [optional] |

### Return type

[**GetInstanceUpgrades200Response**](GetInstanceUpgrades200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_instance_userdata

> <GetInstanceUserdata200Response> get_instance_userdata(instance_id)

Get Instance User Data

Get the user-supplied, base64 encoded [user data](https://www.vultr.com/docs/manage-instance-user-data-with-the-vultr-metadata-api/) for an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).

begin
  # Get Instance User Data
  result = api_instance.get_instance_userdata(instance_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->get_instance_userdata: #{e}"
end
```

#### Using the get_instance_userdata_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetInstanceUserdata200Response>, Integer, Hash)> get_instance_userdata_with_http_info(instance_id)

```ruby
begin
  # Get Instance User Data
  data, status_code, headers = api_instance.get_instance_userdata_with_http_info(instance_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetInstanceUserdata200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->get_instance_userdata_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |

### Return type

[**GetInstanceUserdata200Response**](GetInstanceUserdata200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## halt_instance

> halt_instance(instance_id)

Halt Instance

Halt an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).

begin
  # Halt Instance
  api_instance.halt_instance(instance_id)
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->halt_instance: #{e}"
end
```

#### Using the halt_instance_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> halt_instance_with_http_info(instance_id)

```ruby
begin
  # Halt Instance
  data, status_code, headers = api_instance.halt_instance_with_http_info(instance_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->halt_instance_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## halt_instances

> halt_instances(opts)

Halt Instances

Halt Instances.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
opts = {
  halt_instances_request: VultrRuby::HaltInstancesRequest.new # HaltInstancesRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Halt Instances
  api_instance.halt_instances(opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->halt_instances: #{e}"
end
```

#### Using the halt_instances_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> halt_instances_with_http_info(opts)

```ruby
begin
  # Halt Instances
  data, status_code, headers = api_instance.halt_instances_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->halt_instances_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **halt_instances_request** | [**HaltInstancesRequest**](HaltInstancesRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## list_instance_ipv6_reverse

> <ListInstanceIpv6Reverse200Response> list_instance_ipv6_reverse(instance_id)

List Instance IPv6 Reverse

List the reverse IPv6 information for an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).

begin
  # List Instance IPv6 Reverse
  result = api_instance.list_instance_ipv6_reverse(instance_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->list_instance_ipv6_reverse: #{e}"
end
```

#### Using the list_instance_ipv6_reverse_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListInstanceIpv6Reverse200Response>, Integer, Hash)> list_instance_ipv6_reverse_with_http_info(instance_id)

```ruby
begin
  # List Instance IPv6 Reverse
  data, status_code, headers = api_instance.list_instance_ipv6_reverse_with_http_info(instance_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListInstanceIpv6Reverse200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->list_instance_ipv6_reverse_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |

### Return type

[**ListInstanceIpv6Reverse200Response**](ListInstanceIpv6Reverse200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_instance_private_networks

> <ListInstancePrivateNetworks200Response> list_instance_private_networks(instance_id, opts)

List instance Private Networks

**Deprecated**: use [List Instance VPCs](#operation/list-instance-vpcs) instead.<br><br>List the private networks for an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List instance Private Networks
  result = api_instance.list_instance_private_networks(instance_id, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->list_instance_private_networks: #{e}"
end
```

#### Using the list_instance_private_networks_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListInstancePrivateNetworks200Response>, Integer, Hash)> list_instance_private_networks_with_http_info(instance_id, opts)

```ruby
begin
  # List instance Private Networks
  data, status_code, headers = api_instance.list_instance_private_networks_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListInstancePrivateNetworks200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->list_instance_private_networks_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListInstancePrivateNetworks200Response**](ListInstancePrivateNetworks200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_instance_vpc2

> <ListInstanceVpc2200Response> list_instance_vpc2(instance_id, opts)

List Instance VPC 2.0 Networks

List the VPC 2.0 networks for an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Instance VPC 2.0 Networks
  result = api_instance.list_instance_vpc2(instance_id, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->list_instance_vpc2: #{e}"
end
```

#### Using the list_instance_vpc2_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListInstanceVpc2200Response>, Integer, Hash)> list_instance_vpc2_with_http_info(instance_id, opts)

```ruby
begin
  # List Instance VPC 2.0 Networks
  data, status_code, headers = api_instance.list_instance_vpc2_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListInstanceVpc2200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->list_instance_vpc2_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListInstanceVpc2200Response**](ListInstanceVpc2200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_instance_vpcs

> <ListInstanceVpcs200Response> list_instance_vpcs(instance_id, opts)

List instance VPCs

List the VPCs for an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List instance VPCs
  result = api_instance.list_instance_vpcs(instance_id, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->list_instance_vpcs: #{e}"
end
```

#### Using the list_instance_vpcs_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListInstanceVpcs200Response>, Integer, Hash)> list_instance_vpcs_with_http_info(instance_id, opts)

```ruby
begin
  # List instance VPCs
  data, status_code, headers = api_instance.list_instance_vpcs_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListInstanceVpcs200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->list_instance_vpcs_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListInstanceVpcs200Response**](ListInstanceVpcs200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_instances

> <ListInstances200Response> list_instances(opts)

List Instances

List all VPS instances in your account.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example', # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
  tag: 'tag_example', # String | Filter by specific tag.
  label: 'label_example', # String | Filter by label.
  main_ip: 'main_ip_example', # String | Filter by main ip address.
  region: 'region_example', # String | Filter by [Region id](#operation/list-regions).
  firewall_group_id: 'firewall_group_id_example' # String | Filter by [Firewall group id](#operation/list-firewall-groups).
}

begin
  # List Instances
  result = api_instance.list_instances(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->list_instances: #{e}"
end
```

#### Using the list_instances_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListInstances200Response>, Integer, Hash)> list_instances_with_http_info(opts)

```ruby
begin
  # List Instances
  data, status_code, headers = api_instance.list_instances_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListInstances200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->list_instances_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |
| **tag** | **String** | Filter by specific tag. | [optional] |
| **label** | **String** | Filter by label. | [optional] |
| **main_ip** | **String** | Filter by main ip address. | [optional] |
| **region** | **String** | Filter by [Region id](#operation/list-regions). | [optional] |
| **firewall_group_id** | **String** | Filter by [Firewall group id](#operation/list-firewall-groups). | [optional] |

### Return type

[**ListInstances200Response**](ListInstances200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## post_instances_instance_id_ipv4_reverse_default

> post_instances_instance_id_ipv4_reverse_default(instance_id, opts)

Set Default Reverse DNS Entry

Set a reverse DNS entry for an IPv4 address

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  post_instances_instance_id_ipv4_reverse_default_request: VultrRuby::PostInstancesInstanceIdIpv4ReverseDefaultRequest.new({ip: 'ip_example'}) # PostInstancesInstanceIdIpv4ReverseDefaultRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Set Default Reverse DNS Entry
  api_instance.post_instances_instance_id_ipv4_reverse_default(instance_id, opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->post_instances_instance_id_ipv4_reverse_default: #{e}"
end
```

#### Using the post_instances_instance_id_ipv4_reverse_default_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> post_instances_instance_id_ipv4_reverse_default_with_http_info(instance_id, opts)

```ruby
begin
  # Set Default Reverse DNS Entry
  data, status_code, headers = api_instance.post_instances_instance_id_ipv4_reverse_default_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->post_instances_instance_id_ipv4_reverse_default_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **post_instances_instance_id_ipv4_reverse_default_request** | [**PostInstancesInstanceIdIpv4ReverseDefaultRequest**](PostInstancesInstanceIdIpv4ReverseDefaultRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## reboot_instance

> reboot_instance(instance_id)

Reboot Instance

Reboot an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).

begin
  # Reboot Instance
  api_instance.reboot_instance(instance_id)
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->reboot_instance: #{e}"
end
```

#### Using the reboot_instance_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> reboot_instance_with_http_info(instance_id)

```ruby
begin
  # Reboot Instance
  data, status_code, headers = api_instance.reboot_instance_with_http_info(instance_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->reboot_instance_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## reboot_instances

> reboot_instances(opts)

Reboot instances

Reboot Instances.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
opts = {
  reboot_instances_request: VultrRuby::RebootInstancesRequest.new # RebootInstancesRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Reboot instances
  api_instance.reboot_instances(opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->reboot_instances: #{e}"
end
```

#### Using the reboot_instances_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> reboot_instances_with_http_info(opts)

```ruby
begin
  # Reboot instances
  data, status_code, headers = api_instance.reboot_instances_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->reboot_instances_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reboot_instances_request** | [**RebootInstancesRequest**](RebootInstancesRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## reinstall_instance

> <CreateInstance202Response> reinstall_instance(instance_id, opts)

Reinstall Instance

Reinstall an Instance using an optional `hostname`.  **Note:** This action may take a few extra seconds to complete.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  reinstall_instance_request: VultrRuby::ReinstallInstanceRequest.new # ReinstallInstanceRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Reinstall Instance
  result = api_instance.reinstall_instance(instance_id, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->reinstall_instance: #{e}"
end
```

#### Using the reinstall_instance_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateInstance202Response>, Integer, Hash)> reinstall_instance_with_http_info(instance_id, opts)

```ruby
begin
  # Reinstall Instance
  data, status_code, headers = api_instance.reinstall_instance_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateInstance202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->reinstall_instance_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **reinstall_instance_request** | [**ReinstallInstanceRequest**](ReinstallInstanceRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateInstance202Response**](CreateInstance202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## restore_instance

> <RestoreInstance202Response> restore_instance(instance_id, opts)

Restore Instance

Restore an Instance from either `backup_id` or `snapshot_id`.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  restore_instance_request: VultrRuby::RestoreInstanceRequest.new # RestoreInstanceRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Restore Instance
  result = api_instance.restore_instance(instance_id, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->restore_instance: #{e}"
end
```

#### Using the restore_instance_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<RestoreInstance202Response>, Integer, Hash)> restore_instance_with_http_info(instance_id, opts)

```ruby
begin
  # Restore Instance
  data, status_code, headers = api_instance.restore_instance_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <RestoreInstance202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->restore_instance_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **restore_instance_request** | [**RestoreInstanceRequest**](RestoreInstanceRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**RestoreInstance202Response**](RestoreInstance202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## start_instance

> start_instance(instance_id)

Start instance

Start an Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).

begin
  # Start instance
  api_instance.start_instance(instance_id)
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->start_instance: #{e}"
end
```

#### Using the start_instance_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> start_instance_with_http_info(instance_id)

```ruby
begin
  # Start instance
  data, status_code, headers = api_instance.start_instance_with_http_info(instance_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->start_instance_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## start_instances

> start_instances(opts)

Start instances

Start Instances.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
opts = {
  start_instances_request: VultrRuby::StartInstancesRequest.new # StartInstancesRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Start instances
  api_instance.start_instances(opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->start_instances: #{e}"
end
```

#### Using the start_instances_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> start_instances_with_http_info(opts)

```ruby
begin
  # Start instances
  data, status_code, headers = api_instance.start_instances_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->start_instances_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_instances_request** | [**StartInstancesRequest**](StartInstancesRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## update_instance

> <CreateInstance202Response> update_instance(instance_id, opts)

Update Instance

Update information for an Instance. All attributes are optional. If not set, the attributes will retain their original values.  **Note:** Changing `os_id`, `app_id` or `image_id` may take a few extra seconds to complete.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::InstancesApi.new
instance_id = 'instance_id_example' # String | The [Instance ID](#operation/list-instances).
opts = {
  update_instance_request: VultrRuby::UpdateInstanceRequest.new # UpdateInstanceRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update Instance
  result = api_instance.update_instance(instance_id, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->update_instance: #{e}"
end
```

#### Using the update_instance_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateInstance202Response>, Integer, Hash)> update_instance_with_http_info(instance_id, opts)

```ruby
begin
  # Update Instance
  data, status_code, headers = api_instance.update_instance_with_http_info(instance_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateInstance202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling InstancesApi->update_instance_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **instance_id** | **String** | The [Instance ID](#operation/list-instances). |  |
| **update_instance_request** | [**UpdateInstanceRequest**](UpdateInstanceRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateInstance202Response**](CreateInstance202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

