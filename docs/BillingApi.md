# VultRuby::BillingApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_invoice**](BillingApi.md#get_invoice) | **GET** /billing/invoices/{invoice-id} | Get Invoice |
| [**get_invoice_items**](BillingApi.md#get_invoice_items) | **GET** /billing/invoices/{invoice-id}/items | Get Invoice Items |
| [**list_billing_history**](BillingApi.md#list_billing_history) | **GET** /billing/history | List Billing History |
| [**list_invoices**](BillingApi.md#list_invoices) | **GET** /billing/invoices | List Invoices |


## get_invoice

> <GetInvoice200Response> get_invoice(invoice_id)

Get Invoice

Retrieve specified invoice

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::BillingApi.new
invoice_id = 'invoice_id_example' # String | ID of invoice

begin
  # Get Invoice
  result = api_instance.get_invoice(invoice_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling BillingApi->get_invoice: #{e}"
end
```

#### Using the get_invoice_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetInvoice200Response>, Integer, Hash)> get_invoice_with_http_info(invoice_id)

```ruby
begin
  # Get Invoice
  data, status_code, headers = api_instance.get_invoice_with_http_info(invoice_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetInvoice200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling BillingApi->get_invoice_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoice_id** | **String** | ID of invoice |  |

### Return type

[**GetInvoice200Response**](GetInvoice200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_invoice_items

> <GetInvoiceItems200Response> get_invoice_items(invoice_id)

Get Invoice Items

Retrieve full specified invoice

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::BillingApi.new
invoice_id = 'invoice_id_example' # String | ID of invoice

begin
  # Get Invoice Items
  result = api_instance.get_invoice_items(invoice_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling BillingApi->get_invoice_items: #{e}"
end
```

#### Using the get_invoice_items_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetInvoiceItems200Response>, Integer, Hash)> get_invoice_items_with_http_info(invoice_id)

```ruby
begin
  # Get Invoice Items
  data, status_code, headers = api_instance.get_invoice_items_with_http_info(invoice_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetInvoiceItems200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling BillingApi->get_invoice_items_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoice_id** | **String** | ID of invoice |  |

### Return type

[**GetInvoiceItems200Response**](GetInvoiceItems200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_billing_history

> <ListBillingHistory200Response> list_billing_history

List Billing History

Retrieve list of billing history

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::BillingApi.new

begin
  # List Billing History
  result = api_instance.list_billing_history
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling BillingApi->list_billing_history: #{e}"
end
```

#### Using the list_billing_history_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListBillingHistory200Response>, Integer, Hash)> list_billing_history_with_http_info

```ruby
begin
  # List Billing History
  data, status_code, headers = api_instance.list_billing_history_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListBillingHistory200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling BillingApi->list_billing_history_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ListBillingHistory200Response**](ListBillingHistory200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_invoices

> <ListInvoices200Response> list_invoices

List Invoices

Retrieve a list of invoices

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::BillingApi.new

begin
  # List Invoices
  result = api_instance.list_invoices
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling BillingApi->list_invoices: #{e}"
end
```

#### Using the list_invoices_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListInvoices200Response>, Integer, Hash)> list_invoices_with_http_info

```ruby
begin
  # List Invoices
  data, status_code, headers = api_instance.list_invoices_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListInvoices200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling BillingApi->list_invoices_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ListInvoices200Response**](ListInvoices200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

