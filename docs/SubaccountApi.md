# VultrRuby::SubaccountApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_subaccount**](SubaccountApi.md#create_subaccount) | **POST** /subaccounts | Create Sub-Account |
| [**list_subaccounts**](SubaccountApi.md#list_subaccounts) | **GET** /subaccounts | List Sub-Accounts |


## create_subaccount

> <CreateSubaccount201Response> create_subaccount(opts)

Create Sub-Account

Create a new subaccount.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::SubaccountApi.new
opts = {
  create_subaccount_request: VultrRuby::CreateSubaccountRequest.new({email: 'email_example'}) # CreateSubaccountRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Sub-Account
  result = api_instance.create_subaccount(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling SubaccountApi->create_subaccount: #{e}"
end
```

#### Using the create_subaccount_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateSubaccount201Response>, Integer, Hash)> create_subaccount_with_http_info(opts)

```ruby
begin
  # Create Sub-Account
  data, status_code, headers = api_instance.create_subaccount_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateSubaccount201Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling SubaccountApi->create_subaccount_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_subaccount_request** | [**CreateSubaccountRequest**](CreateSubaccountRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateSubaccount201Response**](CreateSubaccount201Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## list_subaccounts

> <ListSubaccounts200Response> list_subaccounts(opts)

List Sub-Accounts

Get information about all sub-accounts for your account.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::SubaccountApi.new
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Sub-Accounts
  result = api_instance.list_subaccounts(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling SubaccountApi->list_subaccounts: #{e}"
end
```

#### Using the list_subaccounts_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListSubaccounts200Response>, Integer, Hash)> list_subaccounts_with_http_info(opts)

```ruby
begin
  # List Sub-Accounts
  data, status_code, headers = api_instance.list_subaccounts_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListSubaccounts200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling SubaccountApi->list_subaccounts_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListSubaccounts200Response**](ListSubaccounts200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

