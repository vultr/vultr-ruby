# VultrRuby::DnsApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_dns_domain**](DnsApi.md#create_dns_domain) | **POST** /domains | Create DNS Domain |
| [**create_dns_domain_record**](DnsApi.md#create_dns_domain_record) | **POST** /domains/{dns-domain}/records | Create Record |
| [**delete_dns_domain**](DnsApi.md#delete_dns_domain) | **DELETE** /domains/{dns-domain} | Delete Domain |
| [**delete_dns_domain_record**](DnsApi.md#delete_dns_domain_record) | **DELETE** /domains/{dns-domain}/records/{record-id} | Delete Record |
| [**get_dns_domain**](DnsApi.md#get_dns_domain) | **GET** /domains/{dns-domain} | Get DNS Domain |
| [**get_dns_domain_dnssec**](DnsApi.md#get_dns_domain_dnssec) | **GET** /domains/{dns-domain}/dnssec | Get DNSSec Info |
| [**get_dns_domain_record**](DnsApi.md#get_dns_domain_record) | **GET** /domains/{dns-domain}/records/{record-id} | Get Record |
| [**get_dns_domain_soa**](DnsApi.md#get_dns_domain_soa) | **GET** /domains/{dns-domain}/soa | Get SOA information |
| [**list_dns_domain_records**](DnsApi.md#list_dns_domain_records) | **GET** /domains/{dns-domain}/records | List Records |
| [**list_dns_domains**](DnsApi.md#list_dns_domains) | **GET** /domains | List DNS Domains |
| [**update_dns_domain**](DnsApi.md#update_dns_domain) | **PUT** /domains/{dns-domain} | Update a DNS Domain |
| [**update_dns_domain_record**](DnsApi.md#update_dns_domain_record) | **PATCH** /domains/{dns-domain}/records/{record-id} | Update Record |
| [**update_dns_domain_soa**](DnsApi.md#update_dns_domain_soa) | **PATCH** /domains/{dns-domain}/soa | Update SOA information |


## create_dns_domain

> <CreateDnsDomain200Response> create_dns_domain(opts)

Create DNS Domain

Create a DNS Domain for `domain`. If no `ip` address is supplied a domain with no records will be created.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::DnsApi.new
opts = {
  create_dns_domain_request: VultrRuby::CreateDnsDomainRequest.new({domain: 'domain_example'}) # CreateDnsDomainRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create DNS Domain
  result = api_instance.create_dns_domain(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->create_dns_domain: #{e}"
end
```

#### Using the create_dns_domain_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateDnsDomain200Response>, Integer, Hash)> create_dns_domain_with_http_info(opts)

```ruby
begin
  # Create DNS Domain
  data, status_code, headers = api_instance.create_dns_domain_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateDnsDomain200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->create_dns_domain_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_dns_domain_request** | [**CreateDnsDomainRequest**](CreateDnsDomainRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateDnsDomain200Response**](CreateDnsDomain200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_dns_domain_record

> <CreateDnsDomainRecord201Response> create_dns_domain_record(dns_domain, opts)

Create Record

Create a DNS record.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::DnsApi.new
dns_domain = 'dns_domain_example' # String | The [DNS Domain](#operation/list-dns-domains).
opts = {
  create_dns_domain_record_request: VultrRuby::CreateDnsDomainRecordRequest.new({name: 'name_example', type: 'type_example', data: 'data_example'}) # CreateDnsDomainRecordRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Record
  result = api_instance.create_dns_domain_record(dns_domain, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->create_dns_domain_record: #{e}"
end
```

#### Using the create_dns_domain_record_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateDnsDomainRecord201Response>, Integer, Hash)> create_dns_domain_record_with_http_info(dns_domain, opts)

```ruby
begin
  # Create Record
  data, status_code, headers = api_instance.create_dns_domain_record_with_http_info(dns_domain, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateDnsDomainRecord201Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->create_dns_domain_record_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **dns_domain** | **String** | The [DNS Domain](#operation/list-dns-domains). |  |
| **create_dns_domain_record_request** | [**CreateDnsDomainRecordRequest**](CreateDnsDomainRecordRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateDnsDomainRecord201Response**](CreateDnsDomainRecord201Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_dns_domain

> delete_dns_domain(dns_domain)

Delete Domain

Delete the DNS Domain.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::DnsApi.new
dns_domain = 'dns_domain_example' # String | The [DNS Domain](#operation/list-dns-domains).

begin
  # Delete Domain
  api_instance.delete_dns_domain(dns_domain)
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->delete_dns_domain: #{e}"
end
```

#### Using the delete_dns_domain_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_dns_domain_with_http_info(dns_domain)

```ruby
begin
  # Delete Domain
  data, status_code, headers = api_instance.delete_dns_domain_with_http_info(dns_domain)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->delete_dns_domain_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **dns_domain** | **String** | The [DNS Domain](#operation/list-dns-domains). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## delete_dns_domain_record

> delete_dns_domain_record(dns_domain, record_id)

Delete Record

Delete the DNS record.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::DnsApi.new
dns_domain = 'dns_domain_example' # String | The [DNS Domain](#operation/list-dns-domains).
record_id = 'record_id_example' # String | The [DNS Record id](#operation/list-dns-domain-records).

begin
  # Delete Record
  api_instance.delete_dns_domain_record(dns_domain, record_id)
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->delete_dns_domain_record: #{e}"
end
```

#### Using the delete_dns_domain_record_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_dns_domain_record_with_http_info(dns_domain, record_id)

```ruby
begin
  # Delete Record
  data, status_code, headers = api_instance.delete_dns_domain_record_with_http_info(dns_domain, record_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->delete_dns_domain_record_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **dns_domain** | **String** | The [DNS Domain](#operation/list-dns-domains). |  |
| **record_id** | **String** | The [DNS Record id](#operation/list-dns-domain-records). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_dns_domain

> <CreateDnsDomain200Response> get_dns_domain(dns_domain)

Get DNS Domain

Get information for the DNS Domain.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::DnsApi.new
dns_domain = 'dns_domain_example' # String | The [DNS Domain](#operation/list-dns-domains).

begin
  # Get DNS Domain
  result = api_instance.get_dns_domain(dns_domain)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->get_dns_domain: #{e}"
end
```

#### Using the get_dns_domain_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateDnsDomain200Response>, Integer, Hash)> get_dns_domain_with_http_info(dns_domain)

```ruby
begin
  # Get DNS Domain
  data, status_code, headers = api_instance.get_dns_domain_with_http_info(dns_domain)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateDnsDomain200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->get_dns_domain_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **dns_domain** | **String** | The [DNS Domain](#operation/list-dns-domains). |  |

### Return type

[**CreateDnsDomain200Response**](CreateDnsDomain200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_dns_domain_dnssec

> <GetDnsDomainDnssec200Response> get_dns_domain_dnssec(dns_domain)

Get DNSSec Info

Get the DNSSEC information for the DNS Domain.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::DnsApi.new
dns_domain = 'dns_domain_example' # String | The [DNS Domain](#operation/list-dns-domains).

begin
  # Get DNSSec Info
  result = api_instance.get_dns_domain_dnssec(dns_domain)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->get_dns_domain_dnssec: #{e}"
end
```

#### Using the get_dns_domain_dnssec_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetDnsDomainDnssec200Response>, Integer, Hash)> get_dns_domain_dnssec_with_http_info(dns_domain)

```ruby
begin
  # Get DNSSec Info
  data, status_code, headers = api_instance.get_dns_domain_dnssec_with_http_info(dns_domain)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetDnsDomainDnssec200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->get_dns_domain_dnssec_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **dns_domain** | **String** | The [DNS Domain](#operation/list-dns-domains). |  |

### Return type

[**GetDnsDomainDnssec200Response**](GetDnsDomainDnssec200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_dns_domain_record

> <CreateDnsDomainRecord201Response> get_dns_domain_record(dns_domain, record_id)

Get Record

Get information for a DNS Record.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::DnsApi.new
dns_domain = 'dns_domain_example' # String | The [DNS Domain](#operation/list-dns-domains).
record_id = 'record_id_example' # String | The [DNS Record id](#operation/list-dns-domain-records).

begin
  # Get Record
  result = api_instance.get_dns_domain_record(dns_domain, record_id)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->get_dns_domain_record: #{e}"
end
```

#### Using the get_dns_domain_record_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateDnsDomainRecord201Response>, Integer, Hash)> get_dns_domain_record_with_http_info(dns_domain, record_id)

```ruby
begin
  # Get Record
  data, status_code, headers = api_instance.get_dns_domain_record_with_http_info(dns_domain, record_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateDnsDomainRecord201Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->get_dns_domain_record_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **dns_domain** | **String** | The [DNS Domain](#operation/list-dns-domains). |  |
| **record_id** | **String** | The [DNS Record id](#operation/list-dns-domain-records). |  |

### Return type

[**CreateDnsDomainRecord201Response**](CreateDnsDomainRecord201Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_dns_domain_soa

> <GetDnsDomainSoa200Response> get_dns_domain_soa(dns_domain)

Get SOA information

Get SOA information for the DNS Domain.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::DnsApi.new
dns_domain = 'dns_domain_example' # String | The [DNS Domain](#operation/list-dns-domains).

begin
  # Get SOA information
  result = api_instance.get_dns_domain_soa(dns_domain)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->get_dns_domain_soa: #{e}"
end
```

#### Using the get_dns_domain_soa_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetDnsDomainSoa200Response>, Integer, Hash)> get_dns_domain_soa_with_http_info(dns_domain)

```ruby
begin
  # Get SOA information
  data, status_code, headers = api_instance.get_dns_domain_soa_with_http_info(dns_domain)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetDnsDomainSoa200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->get_dns_domain_soa_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **dns_domain** | **String** | The [DNS Domain](#operation/list-dns-domains). |  |

### Return type

[**GetDnsDomainSoa200Response**](GetDnsDomainSoa200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_dns_domain_records

> <ListDnsDomainRecords200Response> list_dns_domain_records(dns_domain, opts)

List Records

Get the DNS records for the Domain.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::DnsApi.new
dns_domain = 'dns_domain_example' # String | The [DNS Domain](#operation/list-dns-domains).
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Records
  result = api_instance.list_dns_domain_records(dns_domain, opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->list_dns_domain_records: #{e}"
end
```

#### Using the list_dns_domain_records_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListDnsDomainRecords200Response>, Integer, Hash)> list_dns_domain_records_with_http_info(dns_domain, opts)

```ruby
begin
  # List Records
  data, status_code, headers = api_instance.list_dns_domain_records_with_http_info(dns_domain, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListDnsDomainRecords200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->list_dns_domain_records_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **dns_domain** | **String** | The [DNS Domain](#operation/list-dns-domains). |  |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListDnsDomainRecords200Response**](ListDnsDomainRecords200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_dns_domains

> <ListDnsDomains200Response> list_dns_domains(opts)

List DNS Domains

List all DNS Domains in your account.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::DnsApi.new
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500. 
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List DNS Domains
  result = api_instance.list_dns_domains(opts)
  p result
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->list_dns_domains: #{e}"
end
```

#### Using the list_dns_domains_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListDnsDomains200Response>, Integer, Hash)> list_dns_domains_with_http_info(opts)

```ruby
begin
  # List DNS Domains
  data, status_code, headers = api_instance.list_dns_domains_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListDnsDomains200Response>
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->list_dns_domains_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500.  | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListDnsDomains200Response**](ListDnsDomains200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_dns_domain

> update_dns_domain(dns_domain, opts)

Update a DNS Domain

Update the DNS Domain. 

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::DnsApi.new
dns_domain = 'dns_domain_example' # String | The [DNS Domain](#operation/list-dns-domains).
opts = {
  update_dns_domain_request: VultrRuby::UpdateDnsDomainRequest.new({dns_sec: 'dns_sec_example'}) # UpdateDnsDomainRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update a DNS Domain
  api_instance.update_dns_domain(dns_domain, opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->update_dns_domain: #{e}"
end
```

#### Using the update_dns_domain_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_dns_domain_with_http_info(dns_domain, opts)

```ruby
begin
  # Update a DNS Domain
  data, status_code, headers = api_instance.update_dns_domain_with_http_info(dns_domain, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->update_dns_domain_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **dns_domain** | **String** | The [DNS Domain](#operation/list-dns-domains). |  |
| **update_dns_domain_request** | [**UpdateDnsDomainRequest**](UpdateDnsDomainRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## update_dns_domain_record

> update_dns_domain_record(dns_domain, record_id, opts)

Update Record

Update the information for a DNS record. All attributes are optional. If not set, the attributes will retain their original values.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::DnsApi.new
dns_domain = 'dns_domain_example' # String | The [DNS Domain](#operation/list-dns-domains).
record_id = 'record_id_example' # String | The [DNS Record id](#operation/list-dns-domain-records).
opts = {
  update_dns_domain_record_request: VultrRuby::UpdateDnsDomainRecordRequest.new # UpdateDnsDomainRecordRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update Record
  api_instance.update_dns_domain_record(dns_domain, record_id, opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->update_dns_domain_record: #{e}"
end
```

#### Using the update_dns_domain_record_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_dns_domain_record_with_http_info(dns_domain, record_id, opts)

```ruby
begin
  # Update Record
  data, status_code, headers = api_instance.update_dns_domain_record_with_http_info(dns_domain, record_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->update_dns_domain_record_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **dns_domain** | **String** | The [DNS Domain](#operation/list-dns-domains). |  |
| **record_id** | **String** | The [DNS Record id](#operation/list-dns-domain-records). |  |
| **update_dns_domain_record_request** | [**UpdateDnsDomainRecordRequest**](UpdateDnsDomainRecordRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## update_dns_domain_soa

> update_dns_domain_soa(dns_domain, opts)

Update SOA information

Update the SOA information for the DNS Domain. All attributes are optional. If not set, the attributes will retain their original values.

### Examples

```ruby
require 'time'
require 'vultr_ruby'
# setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultrRuby::DnsApi.new
dns_domain = 'dns_domain_example' # String | The [DNS Domain](#operation/list-dns-domains).
opts = {
  update_dns_domain_soa_request: VultrRuby::UpdateDnsDomainSoaRequest.new # UpdateDnsDomainSoaRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update SOA information
  api_instance.update_dns_domain_soa(dns_domain, opts)
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->update_dns_domain_soa: #{e}"
end
```

#### Using the update_dns_domain_soa_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_dns_domain_soa_with_http_info(dns_domain, opts)

```ruby
begin
  # Update SOA information
  data, status_code, headers = api_instance.update_dns_domain_soa_with_http_info(dns_domain, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultrRuby::ApiError => e
  puts "Error when calling DnsApi->update_dns_domain_soa_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **dns_domain** | **String** | The [DNS Domain](#operation/list-dns-domains). |  |
| **update_dns_domain_soa_request** | [**UpdateDnsDomainSoaRequest**](UpdateDnsDomainSoaRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

