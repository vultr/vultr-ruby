# VultrRuby::PlansApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list_metal_plans**](PlansApi.md#list_metal_plans) | **GET** /plans-metal | List Bare Metal Plans |
| [**list_plans**](PlansApi.md#list_plans) | **GET** /plans | List Plans |


## list_metal_plans

> <ListMetalPlans200Response> list_metal_plans(opts)

List Bare Metal Plans

Get a list of all Bare Metal plans at Vultr.  The response is an array of JSON `plan` objects, with unique `id` with sub-fields in the general format of:    <type>-<number of cores>-<memory size>-<optional modifier>  For example: `vc2-24c-96gb-sc1`  More about the sub-fields:  * `<type>`: The Vultr type code. For example, `vc2`, `vhf`, `vdc`, etc. * `<number of cores>`: The number of cores, such as `4c` for \"4 cores\", `8c` for \"8 cores\", etc. * `<memory size>`: Size in GB, such as `32gb`. * `<optional modifier>`: Some plans include a modifier for internal identification purposes, such as CPU type or location surcharges.  > Note: This information about plan id format is for general education. Vultr may change the sub-field format or values at any time. You should not attempt to parse the plan ID sub-fields in your code for any specific purpose. 

### Examples

```ruby
require 'time'
require 'vultr_ruby'

api_instance = VultrRuby::PlansApi.new
opts = {
  per_page: 'per_page_example', # String | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Bare Metal Plans
  result = api_instance.list_metal_plans(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling PlansApi->list_metal_plans: #{e}"
end
```

#### Using the list_metal_plans_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListMetalPlans200Response>, Integer, Hash)> list_metal_plans_with_http_info(opts)

```ruby
begin
  # List Bare Metal Plans
  data, status_code, headers = api_instance.list_metal_plans_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListMetalPlans200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling PlansApi->list_metal_plans_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **String** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListMetalPlans200Response**](ListMetalPlans200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_plans

> <ListPlans200Response> list_plans(opts)

List Plans

Get a list of all VPS plans at Vultr.  The response is an array of JSON `plan` objects, with unique `id` with sub-fields in the general format of:    <type>-<number of cores>-<memory size>-<optional modifier>  For example: `vc2-24c-96gb-sc1`  More about the sub-fields:  * `<type>`: The Vultr type code. For example, `vc2`, `vhf`, `vdc`, etc. * `<number of cores>`: The number of cores, such as `4c` for \"4 cores\", `8c` for \"8 cores\", etc. * `<memory size>`: Size in GB, such as `32gb`. * `<optional modifier>`: Some plans include a modifier for internal identification purposes, such as CPU type or location surcharges.  > Note: This information about plan id format is for general education. Vultr may change the sub-field format or values at any time. You should not attempt to parse the plan ID sub-fields in your code for any specific purpose. 

### Examples

```ruby
require 'time'
require 'vultr_ruby'

api_instance = VultrRuby::PlansApi.new
opts = {
  type: 'type_example', # String | Filter the results by type.  | **Type** | **Description** | |----------|-----------------| | all | All available types | | vc2 | Cloud Compute | | vdc | Dedicated Cloud | | vhf | High Frequency Compute | | vhp | High Performance | | voc | All Optimized Cloud types | | voc-g | General Purpose Optimized Cloud | | voc-c | CPU Optimized Cloud | | voc-m | Memory Optimized Cloud | | voc-s | Storage Optimized Cloud | | vcg | Cloud GPU |
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example', # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
  os: 'os_example' # String | Filter the results by operating system.  |   | Type | Description | | - | ------ | ------------- | |   | windows | All available plans that support windows |
}

begin
  # List Plans
  result = api_instance.list_plans(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling PlansApi->list_plans: #{e}"
end
```

#### Using the list_plans_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListPlans200Response>, Integer, Hash)> list_plans_with_http_info(opts)

```ruby
begin
  # List Plans
  data, status_code, headers = api_instance.list_plans_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListPlans200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling PlansApi->list_plans_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Filter the results by type.  | **Type** | **Description** | |----------|-----------------| | all | All available types | | vc2 | Cloud Compute | | vdc | Dedicated Cloud | | vhf | High Frequency Compute | | vhp | High Performance | | voc | All Optimized Cloud types | | voc-g | General Purpose Optimized Cloud | | voc-c | CPU Optimized Cloud | | voc-m | Memory Optimized Cloud | | voc-s | Storage Optimized Cloud | | vcg | Cloud GPU | | [optional] |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |
| **os** | **String** | Filter the results by operating system.  |   | Type | Description | | - | ------ | ------------- | |   | windows | All available plans that support windows | | [optional] |

### Return type

[**ListPlans200Response**](ListPlans200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

