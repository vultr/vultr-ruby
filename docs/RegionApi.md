# VultRuby::RegionApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list_available_plans_region**](RegionApi.md#list_available_plans_region) | **GET** /regions/{region-id}/availability | List available plans in region |
| [**list_regions**](RegionApi.md#list_regions) | **GET** /regions | List Regions |


## list_available_plans_region

> <ListAvailablePlansRegion200Response> list_available_plans_region(region_id, opts)

List available plans in region

Get a list of the available plans in Region `region-id`. Not all plans are available in all regions.

### Examples

```ruby
require 'time'
require 'vult_ruby'

api_instance = VultRuby::RegionApi.new
region_id = 'region_id_example' # String | The [Region id](#operation/list-regions).
opts = {
  type: 'type_example' # String | Filter the results by type.  | **Type** | **Description** | |----------|-----------------| | all | All available types | | vc2 | Cloud Compute | | vdc | Dedicated Cloud | | vhf | High Frequency Compute | | vhp | High Performance | | voc | All Optimized Cloud types | | voc-g | General Purpose Optimized Cloud | | voc-c | CPU Optimized Cloud | | voc-m | Memory Optimized Cloud | | voc-s | Storage Optimized Cloud | | vbm | Bare Metal | | vcg | Cloud GPU | 
}

begin
  # List available plans in region
  result = api_instance.list_available_plans_region(region_id, opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling RegionApi->list_available_plans_region: #{e}"
end
```

#### Using the list_available_plans_region_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListAvailablePlansRegion200Response>, Integer, Hash)> list_available_plans_region_with_http_info(region_id, opts)

```ruby
begin
  # List available plans in region
  data, status_code, headers = api_instance.list_available_plans_region_with_http_info(region_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListAvailablePlansRegion200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling RegionApi->list_available_plans_region_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **region_id** | **String** | The [Region id](#operation/list-regions). |  |
| **type** | **String** | Filter the results by type.  | **Type** | **Description** | |----------|-----------------| | all | All available types | | vc2 | Cloud Compute | | vdc | Dedicated Cloud | | vhf | High Frequency Compute | | vhp | High Performance | | voc | All Optimized Cloud types | | voc-g | General Purpose Optimized Cloud | | voc-c | CPU Optimized Cloud | | voc-m | Memory Optimized Cloud | | voc-s | Storage Optimized Cloud | | vbm | Bare Metal | | vcg | Cloud GPU |  | [optional] |

### Return type

[**ListAvailablePlansRegion200Response**](ListAvailablePlansRegion200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_regions

> <ListRegions200Response> list_regions(opts)

List Regions

List all Regions at Vultr.

### Examples

```ruby
require 'time'
require 'vult_ruby'

api_instance = VultRuby::RegionApi.new
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Regions
  result = api_instance.list_regions(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling RegionApi->list_regions: #{e}"
end
```

#### Using the list_regions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListRegions200Response>, Integer, Hash)> list_regions_with_http_info(opts)

```ruby
begin
  # List Regions
  data, status_code, headers = api_instance.list_regions_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListRegions200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling RegionApi->list_regions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListRegions200Response**](ListRegions200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

