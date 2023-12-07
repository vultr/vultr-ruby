# VultrRuby::BaremetalApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**attach_baremetals_vpc2**](BaremetalApi.md#attach_baremetals_vpc2) | **POST** /bare-metals/{baremetal-id}/vpc2/attach | Attach VPC 2.0 Network to Bare Metal Instance |
| [**create_baremetal**](BaremetalApi.md#create_baremetal) | **POST** /bare-metals | Create Bare Metal Instance |
| [**delete_baremetal**](BaremetalApi.md#delete_baremetal) | **DELETE** /bare-metals/{baremetal-id} | Delete Bare Metal |
| [**detach_baremetal_vpc2**](BaremetalApi.md#detach_baremetal_vpc2) | **POST** /bare-metals/{baremetal-id}/vpc2/detach | Detach VPC 2.0 Network from Bare Metal Instance |
| [**get_bandwidth_baremetal**](BaremetalApi.md#get_bandwidth_baremetal) | **GET** /bare-metals/{baremetal-id}/bandwidth | Bare Metal Bandwidth |
| [**get_bare_metal_userdata**](BaremetalApi.md#get_bare_metal_userdata) | **GET** /bare-metals/{baremetal-id}/user-data | Get Bare Metal User Data |
| [**get_bare_metal_vnc**](BaremetalApi.md#get_bare_metal_vnc) | **GET** /bare-metals/{baremetal-id}/vnc | Get VNC URL for a Bare Metal |
| [**get_bare_metals_upgrades**](BaremetalApi.md#get_bare_metals_upgrades) | **GET** /bare-metals/{baremetal-id}/upgrades | Get Available Bare Metal Upgrades |
| [**get_baremetal**](BaremetalApi.md#get_baremetal) | **GET** /bare-metals/{baremetal-id} | Get Bare Metal |
| [**get_ipv4_baremetal**](BaremetalApi.md#get_ipv4_baremetal) | **GET** /bare-metals/{baremetal-id}/ipv4 | Bare Metal IPv4 Addresses |
| [**get_ipv6_baremetal**](BaremetalApi.md#get_ipv6_baremetal) | **GET** /bare-metals/{baremetal-id}/ipv6 | Bare Metal IPv6 Addresses |
| [**halt_baremetal**](BaremetalApi.md#halt_baremetal) | **POST** /bare-metals/{baremetal-id}/halt | Halt Bare Metal |
| [**halt_baremetals**](BaremetalApi.md#halt_baremetals) | **POST** /bare-metals/halt | Halt Bare Metals |
| [**list_baremetal_vpc2**](BaremetalApi.md#list_baremetal_vpc2) | **GET** /bare-metals/{baremetal-id}/vpc2 | List Bare Metal Instance VPC 2.0 Networks |
| [**list_baremetals**](BaremetalApi.md#list_baremetals) | **GET** /bare-metals | List Bare Metal Instances |
| [**reboot_bare_metals**](BaremetalApi.md#reboot_bare_metals) | **POST** /bare-metals/reboot | Reboot Bare Metals |
| [**reboot_baremetal**](BaremetalApi.md#reboot_baremetal) | **POST** /bare-metals/{baremetal-id}/reboot | Reboot Bare Metal |
| [**reinstall_baremetal**](BaremetalApi.md#reinstall_baremetal) | **POST** /bare-metals/{baremetal-id}/reinstall | Reinstall Bare Metal |
| [**start_bare_metals**](BaremetalApi.md#start_bare_metals) | **POST** /bare-metals/start | Start Bare Metals |
| [**start_baremetal**](BaremetalApi.md#start_baremetal) | **POST** /bare-metals/{baremetal-id}/start | Start Bare Metal |
| [**update_baremetal**](BaremetalApi.md#update_baremetal) | **PATCH** /bare-metals/{baremetal-id} | Update Bare Metal |


## attach_baremetals_vpc2

> attach_baremetals_vpc2(baremetal_id, opts)

Attach VPC 2.0 Network to Bare Metal Instance

Attach a VPC 2.0 Network to a Bare Metal Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
baremetal_id = 'baremetal_id_example' # String | The [Bare Metal ID](#operation/list-baremetals).
opts = {
  attach_baremetals_vpc2_request: VultrRuby::AttachBaremetalsVpc2Request.new # AttachBaremetalsVpc2Request | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Attach VPC 2.0 Network to Bare Metal Instance
  api_instance.attach_baremetals_vpc2(baremetal_id, opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->attach_baremetals_vpc2: #{e}"
end
```

#### Using the attach_baremetals_vpc2_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> attach_baremetals_vpc2_with_http_info(baremetal_id, opts)

```ruby
begin
  # Attach VPC 2.0 Network to Bare Metal Instance
  data, status_code, headers = api_instance.attach_baremetals_vpc2_with_http_info(baremetal_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->attach_baremetals_vpc2_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **baremetal_id** | **String** | The [Bare Metal ID](#operation/list-baremetals). |  |
| **attach_baremetals_vpc2_request** | [**AttachBaremetalsVpc2Request**](AttachBaremetalsVpc2Request.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## create_baremetal

> <CreateBaremetal202Response> create_baremetal(opts)

Create Bare Metal Instance

Create a new Bare Metal instance in a `region` with the desired `plan`. Choose one of the following to deploy the instance:  * `os_id` * `snapshot_id` * `app_id` * `image_id`  Supply other attributes as desired.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
opts = {
  create_baremetal_request: VultrRuby::CreateBaremetalRequest.new({region: 'region_example', plan: 'plan_example'}) # CreateBaremetalRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Bare Metal Instance
  result = api_instance.create_baremetal(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->create_baremetal: #{e}"
end
```

#### Using the create_baremetal_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateBaremetal202Response>, Integer, Hash)> create_baremetal_with_http_info(opts)

```ruby
begin
  # Create Bare Metal Instance
  data, status_code, headers = api_instance.create_baremetal_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateBaremetal202Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->create_baremetal_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_baremetal_request** | [**CreateBaremetalRequest**](CreateBaremetalRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateBaremetal202Response**](CreateBaremetal202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_baremetal

> delete_baremetal(baremetal_id)

Delete Bare Metal

Delete a Bare Metal instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
baremetal_id = 'baremetal_id_example' # String | The [Bare Metal id](#operation/list-baremetals).

begin
  # Delete Bare Metal
  api_instance.delete_baremetal(baremetal_id)
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->delete_baremetal: #{e}"
end
```

#### Using the delete_baremetal_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_baremetal_with_http_info(baremetal_id)

```ruby
begin
  # Delete Bare Metal
  data, status_code, headers = api_instance.delete_baremetal_with_http_info(baremetal_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->delete_baremetal_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **baremetal_id** | **String** | The [Bare Metal id](#operation/list-baremetals). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## detach_baremetal_vpc2

> detach_baremetal_vpc2(baremetal_id, opts)

Detach VPC 2.0 Network from Bare Metal Instance

Detach a VPC 2.0 Network from an Bare Metal Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
baremetal_id = 'baremetal_id_example' # String | The [bare-metal ID](#operation/list-baremetals).
opts = {
  detach_baremetal_vpc2_request: VultrRuby::DetachBaremetalVpc2Request.new # DetachBaremetalVpc2Request | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Detach VPC 2.0 Network from Bare Metal Instance
  api_instance.detach_baremetal_vpc2(baremetal_id, opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->detach_baremetal_vpc2: #{e}"
end
```

#### Using the detach_baremetal_vpc2_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> detach_baremetal_vpc2_with_http_info(baremetal_id, opts)

```ruby
begin
  # Detach VPC 2.0 Network from Bare Metal Instance
  data, status_code, headers = api_instance.detach_baremetal_vpc2_with_http_info(baremetal_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->detach_baremetal_vpc2_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **baremetal_id** | **String** | The [bare-metal ID](#operation/list-baremetals). |  |
| **detach_baremetal_vpc2_request** | [**DetachBaremetalVpc2Request**](DetachBaremetalVpc2Request.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## get_bandwidth_baremetal

> <GetBandwidthBaremetal200Response> get_bandwidth_baremetal(baremetal_id)

Bare Metal Bandwidth

Get bandwidth information for the Bare Metal instance.<br><br>The `bandwidth` object in a successful response contains objects representing a day in the month. The date is denoted by the nested object keys. Days begin and end in the UTC timezone. Bandwidth utilization data contained within the date object is refreshed periodically. We do not recommend using this endpoint to gather real-time metrics.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
baremetal_id = 'baremetal_id_example' # String | The [Bare Metal id](#operation/list-baremetals).

begin
  # Bare Metal Bandwidth
  result = api_instance.get_bandwidth_baremetal(baremetal_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->get_bandwidth_baremetal: #{e}"
end
```

#### Using the get_bandwidth_baremetal_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetBandwidthBaremetal200Response>, Integer, Hash)> get_bandwidth_baremetal_with_http_info(baremetal_id)

```ruby
begin
  # Bare Metal Bandwidth
  data, status_code, headers = api_instance.get_bandwidth_baremetal_with_http_info(baremetal_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetBandwidthBaremetal200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->get_bandwidth_baremetal_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **baremetal_id** | **String** | The [Bare Metal id](#operation/list-baremetals). |  |

### Return type

[**GetBandwidthBaremetal200Response**](GetBandwidthBaremetal200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_bare_metal_userdata

> <GetBareMetalUserdata200Response> get_bare_metal_userdata(baremetal_id)

Get Bare Metal User Data

Get the user-supplied, base64 encoded [user data](https://www.vultr.com/docs/manage-instance-user-data-with-the-vultr-metadata-api/) for a Bare Metal.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
baremetal_id = 'baremetal_id_example' # String | The [Bare Metal id](#operation/list-baremetals).

begin
  # Get Bare Metal User Data
  result = api_instance.get_bare_metal_userdata(baremetal_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->get_bare_metal_userdata: #{e}"
end
```

#### Using the get_bare_metal_userdata_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetBareMetalUserdata200Response>, Integer, Hash)> get_bare_metal_userdata_with_http_info(baremetal_id)

```ruby
begin
  # Get Bare Metal User Data
  data, status_code, headers = api_instance.get_bare_metal_userdata_with_http_info(baremetal_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetBareMetalUserdata200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->get_bare_metal_userdata_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **baremetal_id** | **String** | The [Bare Metal id](#operation/list-baremetals). |  |

### Return type

[**GetBareMetalUserdata200Response**](GetBareMetalUserdata200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_bare_metal_vnc

> <GetBareMetalVnc200Response> get_bare_metal_vnc(baremetal_id)

Get VNC URL for a Bare Metal

Get the VNC URL for a Bare Metal

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
baremetal_id = 'baremetal_id_example' # String | The [Bare Metal id](#operation/list-baremetals).

begin
  # Get VNC URL for a Bare Metal
  result = api_instance.get_bare_metal_vnc(baremetal_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->get_bare_metal_vnc: #{e}"
end
```

#### Using the get_bare_metal_vnc_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetBareMetalVnc200Response>, Integer, Hash)> get_bare_metal_vnc_with_http_info(baremetal_id)

```ruby
begin
  # Get VNC URL for a Bare Metal
  data, status_code, headers = api_instance.get_bare_metal_vnc_with_http_info(baremetal_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetBareMetalVnc200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->get_bare_metal_vnc_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **baremetal_id** | **String** | The [Bare Metal id](#operation/list-baremetals). |  |

### Return type

[**GetBareMetalVnc200Response**](GetBareMetalVnc200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_bare_metals_upgrades

> <GetBareMetalsUpgrades200Response> get_bare_metals_upgrades(baremetal_id, opts)

Get Available Bare Metal Upgrades

Get available upgrades for a Bare Metal

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
baremetal_id = 'baremetal_id_example' # String | The [Bare Metal id](#operation/list-baremetals).
opts = {
  type: 'type_example' # String | Filter upgrade by type:  - all (applications, plans) - applications - os
}

begin
  # Get Available Bare Metal Upgrades
  result = api_instance.get_bare_metals_upgrades(baremetal_id, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->get_bare_metals_upgrades: #{e}"
end
```

#### Using the get_bare_metals_upgrades_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetBareMetalsUpgrades200Response>, Integer, Hash)> get_bare_metals_upgrades_with_http_info(baremetal_id, opts)

```ruby
begin
  # Get Available Bare Metal Upgrades
  data, status_code, headers = api_instance.get_bare_metals_upgrades_with_http_info(baremetal_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetBareMetalsUpgrades200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->get_bare_metals_upgrades_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **baremetal_id** | **String** | The [Bare Metal id](#operation/list-baremetals). |  |
| **type** | **String** | Filter upgrade by type:  - all (applications, plans) - applications - os | [optional] |

### Return type

[**GetBareMetalsUpgrades200Response**](GetBareMetalsUpgrades200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_baremetal

> <GetBaremetal200Response> get_baremetal(baremetal_id)

Get Bare Metal

Get information for a Bare Metal instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
baremetal_id = 'baremetal_id_example' # String | The [Bare Metal id](#operation/list-baremetals).

begin
  # Get Bare Metal
  result = api_instance.get_baremetal(baremetal_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->get_baremetal: #{e}"
end
```

#### Using the get_baremetal_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetBaremetal200Response>, Integer, Hash)> get_baremetal_with_http_info(baremetal_id)

```ruby
begin
  # Get Bare Metal
  data, status_code, headers = api_instance.get_baremetal_with_http_info(baremetal_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetBaremetal200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->get_baremetal_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **baremetal_id** | **String** | The [Bare Metal id](#operation/list-baremetals). |  |

### Return type

[**GetBaremetal200Response**](GetBaremetal200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_ipv4_baremetal

> <GetIpv4Baremetal200Response> get_ipv4_baremetal(baremetal_id)

Bare Metal IPv4 Addresses

Get the IPv4 information for the Bare Metal instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
baremetal_id = 'baremetal_id_example' # String | The [Bare Metal id](#operation/list-baremetals).

begin
  # Bare Metal IPv4 Addresses
  result = api_instance.get_ipv4_baremetal(baremetal_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->get_ipv4_baremetal: #{e}"
end
```

#### Using the get_ipv4_baremetal_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetIpv4Baremetal200Response>, Integer, Hash)> get_ipv4_baremetal_with_http_info(baremetal_id)

```ruby
begin
  # Bare Metal IPv4 Addresses
  data, status_code, headers = api_instance.get_ipv4_baremetal_with_http_info(baremetal_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetIpv4Baremetal200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->get_ipv4_baremetal_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **baremetal_id** | **String** | The [Bare Metal id](#operation/list-baremetals). |  |

### Return type

[**GetIpv4Baremetal200Response**](GetIpv4Baremetal200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_ipv6_baremetal

> <GetIpv6Baremetal200Response> get_ipv6_baremetal(baremetal_id)

Bare Metal IPv6 Addresses

Get the IPv6 information for the Bare Metal instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
baremetal_id = 'baremetal_id_example' # String | The [Bare Metal id](#operation/list-baremetals).

begin
  # Bare Metal IPv6 Addresses
  result = api_instance.get_ipv6_baremetal(baremetal_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->get_ipv6_baremetal: #{e}"
end
```

#### Using the get_ipv6_baremetal_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetIpv6Baremetal200Response>, Integer, Hash)> get_ipv6_baremetal_with_http_info(baremetal_id)

```ruby
begin
  # Bare Metal IPv6 Addresses
  data, status_code, headers = api_instance.get_ipv6_baremetal_with_http_info(baremetal_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetIpv6Baremetal200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->get_ipv6_baremetal_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **baremetal_id** | **String** | The [Bare Metal id](#operation/list-baremetals). |  |

### Return type

[**GetIpv6Baremetal200Response**](GetIpv6Baremetal200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## halt_baremetal

> halt_baremetal(baremetal_id)

Halt Bare Metal

Halt the Bare Metal instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
baremetal_id = 'baremetal_id_example' # String | The [Bare Metal id](#operation/list-baremetals).

begin
  # Halt Bare Metal
  api_instance.halt_baremetal(baremetal_id)
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->halt_baremetal: #{e}"
end
```

#### Using the halt_baremetal_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> halt_baremetal_with_http_info(baremetal_id)

```ruby
begin
  # Halt Bare Metal
  data, status_code, headers = api_instance.halt_baremetal_with_http_info(baremetal_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->halt_baremetal_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **baremetal_id** | **String** | The [Bare Metal id](#operation/list-baremetals). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## halt_baremetals

> halt_baremetals(opts)

Halt Bare Metals

Halt Bare Metals.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
opts = {
  halt_baremetals_request: VultrRuby::HaltBaremetalsRequest.new # HaltBaremetalsRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Halt Bare Metals
  api_instance.halt_baremetals(opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->halt_baremetals: #{e}"
end
```

#### Using the halt_baremetals_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> halt_baremetals_with_http_info(opts)

```ruby
begin
  # Halt Bare Metals
  data, status_code, headers = api_instance.halt_baremetals_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->halt_baremetals_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **halt_baremetals_request** | [**HaltBaremetalsRequest**](HaltBaremetalsRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## list_baremetal_vpc2

> <ListBaremetalVpc2200Response> list_baremetal_vpc2(baremetal_id)

List Bare Metal Instance VPC 2.0 Networks

List the VPC 2.0 networks for a Bare Metal Instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
baremetal_id = 'baremetal_id_example' # String | The [Bare Metal ID](#operation/list-baremetals).

begin
  # List Bare Metal Instance VPC 2.0 Networks
  result = api_instance.list_baremetal_vpc2(baremetal_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->list_baremetal_vpc2: #{e}"
end
```

#### Using the list_baremetal_vpc2_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListBaremetalVpc2200Response>, Integer, Hash)> list_baremetal_vpc2_with_http_info(baremetal_id)

```ruby
begin
  # List Bare Metal Instance VPC 2.0 Networks
  data, status_code, headers = api_instance.list_baremetal_vpc2_with_http_info(baremetal_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListBaremetalVpc2200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->list_baremetal_vpc2_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **baremetal_id** | **String** | The [Bare Metal ID](#operation/list-baremetals). |  |

### Return type

[**ListBaremetalVpc2200Response**](ListBaremetalVpc2200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_baremetals

> <ListBaremetals200Response> list_baremetals(opts)

List Bare Metal Instances

List all Bare Metal instances in your account.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500. 
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Bare Metal Instances
  result = api_instance.list_baremetals(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->list_baremetals: #{e}"
end
```

#### Using the list_baremetals_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListBaremetals200Response>, Integer, Hash)> list_baremetals_with_http_info(opts)

```ruby
begin
  # List Bare Metal Instances
  data, status_code, headers = api_instance.list_baremetals_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListBaremetals200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->list_baremetals_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500.  | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListBaremetals200Response**](ListBaremetals200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## reboot_bare_metals

> reboot_bare_metals(opts)

Reboot Bare Metals

Reboot Bare Metals.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
opts = {
  halt_baremetals_request: VultrRuby::HaltBaremetalsRequest.new # HaltBaremetalsRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Reboot Bare Metals
  api_instance.reboot_bare_metals(opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->reboot_bare_metals: #{e}"
end
```

#### Using the reboot_bare_metals_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> reboot_bare_metals_with_http_info(opts)

```ruby
begin
  # Reboot Bare Metals
  data, status_code, headers = api_instance.reboot_bare_metals_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->reboot_bare_metals_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **halt_baremetals_request** | [**HaltBaremetalsRequest**](HaltBaremetalsRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## reboot_baremetal

> reboot_baremetal(baremetal_id)

Reboot Bare Metal

Reboot the Bare Metal instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
baremetal_id = 'baremetal_id_example' # String | The [Bare Metal id](#operation/list-baremetals).

begin
  # Reboot Bare Metal
  api_instance.reboot_baremetal(baremetal_id)
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->reboot_baremetal: #{e}"
end
```

#### Using the reboot_baremetal_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> reboot_baremetal_with_http_info(baremetal_id)

```ruby
begin
  # Reboot Bare Metal
  data, status_code, headers = api_instance.reboot_baremetal_with_http_info(baremetal_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->reboot_baremetal_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **baremetal_id** | **String** | The [Bare Metal id](#operation/list-baremetals). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## reinstall_baremetal

> <GetBaremetal200Response> reinstall_baremetal(baremetal_id, opts)

Reinstall Bare Metal

Reinstall the Bare Metal instance using an optional `hostname`.   **Note:** This action may take some time to complete.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
baremetal_id = 'baremetal_id_example' # String | The [Bare Metal id](#operation/list-baremetals).
opts = {
  reinstall_baremetal_request: VultrRuby::ReinstallBaremetalRequest.new # ReinstallBaremetalRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Reinstall Bare Metal
  result = api_instance.reinstall_baremetal(baremetal_id, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->reinstall_baremetal: #{e}"
end
```

#### Using the reinstall_baremetal_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetBaremetal200Response>, Integer, Hash)> reinstall_baremetal_with_http_info(baremetal_id, opts)

```ruby
begin
  # Reinstall Bare Metal
  data, status_code, headers = api_instance.reinstall_baremetal_with_http_info(baremetal_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetBaremetal200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->reinstall_baremetal_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **baremetal_id** | **String** | The [Bare Metal id](#operation/list-baremetals). |  |
| **reinstall_baremetal_request** | [**ReinstallBaremetalRequest**](ReinstallBaremetalRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**GetBaremetal200Response**](GetBaremetal200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## start_bare_metals

> start_bare_metals(opts)

Start Bare Metals

Start Bare Metals.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
opts = {
  halt_baremetals_request: VultrRuby::HaltBaremetalsRequest.new # HaltBaremetalsRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Start Bare Metals
  api_instance.start_bare_metals(opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->start_bare_metals: #{e}"
end
```

#### Using the start_bare_metals_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> start_bare_metals_with_http_info(opts)

```ruby
begin
  # Start Bare Metals
  data, status_code, headers = api_instance.start_bare_metals_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->start_bare_metals_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **halt_baremetals_request** | [**HaltBaremetalsRequest**](HaltBaremetalsRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## start_baremetal

> start_baremetal(baremetal_id)

Start Bare Metal

Start the Bare Metal instance.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
baremetal_id = 'baremetal_id_example' # String | The [Bare Metal id](#operation/list-baremetals).

begin
  # Start Bare Metal
  api_instance.start_baremetal(baremetal_id)
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->start_baremetal: #{e}"
end
```

#### Using the start_baremetal_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> start_baremetal_with_http_info(baremetal_id)

```ruby
begin
  # Start Bare Metal
  data, status_code, headers = api_instance.start_baremetal_with_http_info(baremetal_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->start_baremetal_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **baremetal_id** | **String** | The [Bare Metal id](#operation/list-baremetals). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## update_baremetal

> <GetBaremetal200Response> update_baremetal(baremetal_id, opts)

Update Bare Metal

Update a Bare Metal instance. All attributes are optional. If not set, the attributes will retain their original values.  **Note:** Changing `os_id`, `app_id` or `image_id` may take a few extra seconds to complete.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::BaremetalApi.new
baremetal_id = 'baremetal_id_example' # String | The [Bare Metal id](#operation/list-baremetals).
opts = {
  update_baremetal_request: VultrRuby::UpdateBaremetalRequest.new # UpdateBaremetalRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update Bare Metal
  result = api_instance.update_baremetal(baremetal_id, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->update_baremetal: #{e}"
end
```

#### Using the update_baremetal_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetBaremetal200Response>, Integer, Hash)> update_baremetal_with_http_info(baremetal_id, opts)

```ruby
begin
  # Update Bare Metal
  data, status_code, headers = api_instance.update_baremetal_with_http_info(baremetal_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetBaremetal200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling BaremetalApi->update_baremetal_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **baremetal_id** | **String** | The [Bare Metal id](#operation/list-baremetals). |  |
| **update_baremetal_request** | [**UpdateBaremetalRequest**](UpdateBaremetalRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**GetBaremetal200Response**](GetBaremetal200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

