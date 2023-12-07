# VultRuby::LoadBalancerApi

All URIs are relative to *https://api.vultr.com/v2*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_load_balancer**](LoadBalancerApi.md#create_load_balancer) | **POST** /load-balancers | Create Load Balancer |
| [**create_load_balancer_forwarding_rules**](LoadBalancerApi.md#create_load_balancer_forwarding_rules) | **POST** /load-balancers/{load-balancer-id}/forwarding-rules | Create Forwarding Rule |
| [**delete_load_balancer**](LoadBalancerApi.md#delete_load_balancer) | **DELETE** /load-balancers/{load-balancer-id} | Delete Load Balancer |
| [**delete_load_balancer_forwarding_rule**](LoadBalancerApi.md#delete_load_balancer_forwarding_rule) | **DELETE** /load-balancers/{load-balancer-id}/forwarding-rules/{forwarding-rule-id} | Delete Forwarding Rule |
| [**delete_load_balancer_ssl**](LoadBalancerApi.md#delete_load_balancer_ssl) | **DELETE** /load-balancers/{load-balancer-id}/ssl | Delete Load Balancer SSL |
| [**get_load_balancer**](LoadBalancerApi.md#get_load_balancer) | **GET** /load-balancers/{load-balancer-id} | Get Load Balancer |
| [**get_load_balancer_forwarding_rule**](LoadBalancerApi.md#get_load_balancer_forwarding_rule) | **GET** /load-balancers/{load-balancer-id}/forwarding-rules/{forwarding-rule-id} | Get Forwarding Rule |
| [**get_loadbalancer_firewall_rule**](LoadBalancerApi.md#get_loadbalancer_firewall_rule) | **GET** /load-balancers/{loadbalancer-id}/firewall-rules/{firewall-rule-id} | Get Firewall Rule |
| [**list_load_balancer_forwarding_rules**](LoadBalancerApi.md#list_load_balancer_forwarding_rules) | **GET** /load-balancers/{load-balancer-id}/forwarding-rules | List Forwarding Rules |
| [**list_load_balancers**](LoadBalancerApi.md#list_load_balancers) | **GET** /load-balancers | List Load Balancers |
| [**list_loadbalancer_firewall_rules**](LoadBalancerApi.md#list_loadbalancer_firewall_rules) | **GET** /load-balancers/{loadbalancer-id}/firewall-rules | List Firewall Rules |
| [**update_load_balancer**](LoadBalancerApi.md#update_load_balancer) | **PATCH** /load-balancers/{load-balancer-id} | Update Load Balancer |


## create_load_balancer

> <CreateLoadBalancer202Response> create_load_balancer(opts)

Create Load Balancer

Create a new Load Balancer in a particular `region`.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::LoadBalancerApi.new
opts = {
  create_load_balancer_request: VultRuby::CreateLoadBalancerRequest.new({region: 'region_example'}) # CreateLoadBalancerRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Load Balancer
  result = api_instance.create_load_balancer(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->create_load_balancer: #{e}"
end
```

#### Using the create_load_balancer_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateLoadBalancer202Response>, Integer, Hash)> create_load_balancer_with_http_info(opts)

```ruby
begin
  # Create Load Balancer
  data, status_code, headers = api_instance.create_load_balancer_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateLoadBalancer202Response>
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->create_load_balancer_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_load_balancer_request** | [**CreateLoadBalancerRequest**](CreateLoadBalancerRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

[**CreateLoadBalancer202Response**](CreateLoadBalancer202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_load_balancer_forwarding_rules

> create_load_balancer_forwarding_rules(load_balancer_id, opts)

Create Forwarding Rule

Create a new forwarding rule for a Load Balancer.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::LoadBalancerApi.new
load_balancer_id = 'load_balancer_id_example' # String | The [Load Balancer id](#operation/list-load-balancers).
opts = {
  create_load_balancer_forwarding_rules_request: VultRuby::CreateLoadBalancerForwardingRulesRequest.new({frontend_protocol: 'frontend_protocol_example', frontend_port: 37, backend_protocol: 'backend_protocol_example', backend_port: 37}) # CreateLoadBalancerForwardingRulesRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Create Forwarding Rule
  api_instance.create_load_balancer_forwarding_rules(load_balancer_id, opts)
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->create_load_balancer_forwarding_rules: #{e}"
end
```

#### Using the create_load_balancer_forwarding_rules_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> create_load_balancer_forwarding_rules_with_http_info(load_balancer_id, opts)

```ruby
begin
  # Create Forwarding Rule
  data, status_code, headers = api_instance.create_load_balancer_forwarding_rules_with_http_info(load_balancer_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->create_load_balancer_forwarding_rules_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **load_balancer_id** | **String** | The [Load Balancer id](#operation/list-load-balancers). |  |
| **create_load_balancer_forwarding_rules_request** | [**CreateLoadBalancerForwardingRulesRequest**](CreateLoadBalancerForwardingRulesRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## delete_load_balancer

> delete_load_balancer(load_balancer_id)

Delete Load Balancer

Delete a Load Balancer.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::LoadBalancerApi.new
load_balancer_id = 'load_balancer_id_example' # String | The [Load Balancer id](#operation/list-load-balancers).

begin
  # Delete Load Balancer
  api_instance.delete_load_balancer(load_balancer_id)
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->delete_load_balancer: #{e}"
end
```

#### Using the delete_load_balancer_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_load_balancer_with_http_info(load_balancer_id)

```ruby
begin
  # Delete Load Balancer
  data, status_code, headers = api_instance.delete_load_balancer_with_http_info(load_balancer_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->delete_load_balancer_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **load_balancer_id** | **String** | The [Load Balancer id](#operation/list-load-balancers). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## delete_load_balancer_forwarding_rule

> delete_load_balancer_forwarding_rule(load_balancer_id, forwarding_rule_id)

Delete Forwarding Rule

Delete a Forwarding Rule on a Load Balancer.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::LoadBalancerApi.new
load_balancer_id = 'load_balancer_id_example' # String | The [Load Balancer id](#operation/list-load-balancers).
forwarding_rule_id = 'forwarding_rule_id_example' # String | The [Forwarding Rule id](#operation/list-load-balancer-forwarding-rules).

begin
  # Delete Forwarding Rule
  api_instance.delete_load_balancer_forwarding_rule(load_balancer_id, forwarding_rule_id)
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->delete_load_balancer_forwarding_rule: #{e}"
end
```

#### Using the delete_load_balancer_forwarding_rule_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_load_balancer_forwarding_rule_with_http_info(load_balancer_id, forwarding_rule_id)

```ruby
begin
  # Delete Forwarding Rule
  data, status_code, headers = api_instance.delete_load_balancer_forwarding_rule_with_http_info(load_balancer_id, forwarding_rule_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->delete_load_balancer_forwarding_rule_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **load_balancer_id** | **String** | The [Load Balancer id](#operation/list-load-balancers). |  |
| **forwarding_rule_id** | **String** | The [Forwarding Rule id](#operation/list-load-balancer-forwarding-rules). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## delete_load_balancer_ssl

> delete_load_balancer_ssl(load_balancer_id)

Delete Load Balancer SSL

Delete a Load Balancer SSL.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::LoadBalancerApi.new
load_balancer_id = 'load_balancer_id_example' # String | The [Load Balancer id](#operation/delete-load-balancer-ssl).

begin
  # Delete Load Balancer SSL
  api_instance.delete_load_balancer_ssl(load_balancer_id)
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->delete_load_balancer_ssl: #{e}"
end
```

#### Using the delete_load_balancer_ssl_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_load_balancer_ssl_with_http_info(load_balancer_id)

```ruby
begin
  # Delete Load Balancer SSL
  data, status_code, headers = api_instance.delete_load_balancer_ssl_with_http_info(load_balancer_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->delete_load_balancer_ssl_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **load_balancer_id** | **String** | The [Load Balancer id](#operation/delete-load-balancer-ssl). |  |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_load_balancer

> <CreateLoadBalancer202Response> get_load_balancer(load_balancer_id)

Get Load Balancer

Get information for a Load Balancer.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::LoadBalancerApi.new
load_balancer_id = 'load_balancer_id_example' # String | The [Load Balancer id](#operation/list-load-balancers).

begin
  # Get Load Balancer
  result = api_instance.get_load_balancer(load_balancer_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->get_load_balancer: #{e}"
end
```

#### Using the get_load_balancer_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateLoadBalancer202Response>, Integer, Hash)> get_load_balancer_with_http_info(load_balancer_id)

```ruby
begin
  # Get Load Balancer
  data, status_code, headers = api_instance.get_load_balancer_with_http_info(load_balancer_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateLoadBalancer202Response>
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->get_load_balancer_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **load_balancer_id** | **String** | The [Load Balancer id](#operation/list-load-balancers). |  |

### Return type

[**CreateLoadBalancer202Response**](CreateLoadBalancer202Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_load_balancer_forwarding_rule

> <GetLoadBalancerForwardingRule200Response> get_load_balancer_forwarding_rule(load_balancer_id, forwarding_rule_id)

Get Forwarding Rule

Get information for a Forwarding Rule on a Load Balancer.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::LoadBalancerApi.new
load_balancer_id = 'load_balancer_id_example' # String | The [Load Balancer id](#operation/list-load-balancers).
forwarding_rule_id = 'forwarding_rule_id_example' # String | The [Forwarding Rule id](#operation/list-load-balancer-forwarding-rules).

begin
  # Get Forwarding Rule
  result = api_instance.get_load_balancer_forwarding_rule(load_balancer_id, forwarding_rule_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->get_load_balancer_forwarding_rule: #{e}"
end
```

#### Using the get_load_balancer_forwarding_rule_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetLoadBalancerForwardingRule200Response>, Integer, Hash)> get_load_balancer_forwarding_rule_with_http_info(load_balancer_id, forwarding_rule_id)

```ruby
begin
  # Get Forwarding Rule
  data, status_code, headers = api_instance.get_load_balancer_forwarding_rule_with_http_info(load_balancer_id, forwarding_rule_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetLoadBalancerForwardingRule200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->get_load_balancer_forwarding_rule_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **load_balancer_id** | **String** | The [Load Balancer id](#operation/list-load-balancers). |  |
| **forwarding_rule_id** | **String** | The [Forwarding Rule id](#operation/list-load-balancer-forwarding-rules). |  |

### Return type

[**GetLoadBalancerForwardingRule200Response**](GetLoadBalancerForwardingRule200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_loadbalancer_firewall_rule

> <LoadbalancerFirewallRule> get_loadbalancer_firewall_rule(loadbalancer_id, firewall_rule_id)

Get Firewall Rule

Get a firewall rule for a Load Balancer.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::LoadBalancerApi.new
loadbalancer_id = 'loadbalancer_id_example' # String | 
firewall_rule_id = 'firewall_rule_id_example' # String | 

begin
  # Get Firewall Rule
  result = api_instance.get_loadbalancer_firewall_rule(loadbalancer_id, firewall_rule_id)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->get_loadbalancer_firewall_rule: #{e}"
end
```

#### Using the get_loadbalancer_firewall_rule_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<LoadbalancerFirewallRule>, Integer, Hash)> get_loadbalancer_firewall_rule_with_http_info(loadbalancer_id, firewall_rule_id)

```ruby
begin
  # Get Firewall Rule
  data, status_code, headers = api_instance.get_loadbalancer_firewall_rule_with_http_info(loadbalancer_id, firewall_rule_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <LoadbalancerFirewallRule>
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->get_loadbalancer_firewall_rule_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **loadbalancer_id** | **String** |  |  |
| **firewall_rule_id** | **String** |  |  |

### Return type

[**LoadbalancerFirewallRule**](LoadbalancerFirewallRule.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_load_balancer_forwarding_rules

> <ListLoadBalancerForwardingRules200Response> list_load_balancer_forwarding_rules(load_balancer_id, opts)

List Forwarding Rules

List the fowarding rules for a Load Balancer.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::LoadBalancerApi.new
load_balancer_id = 'load_balancer_id_example' # String | The [Load Balancer id](#operation/list-load-balancers).
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Forwarding Rules
  result = api_instance.list_load_balancer_forwarding_rules(load_balancer_id, opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->list_load_balancer_forwarding_rules: #{e}"
end
```

#### Using the list_load_balancer_forwarding_rules_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListLoadBalancerForwardingRules200Response>, Integer, Hash)> list_load_balancer_forwarding_rules_with_http_info(load_balancer_id, opts)

```ruby
begin
  # List Forwarding Rules
  data, status_code, headers = api_instance.list_load_balancer_forwarding_rules_with_http_info(load_balancer_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListLoadBalancerForwardingRules200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->list_load_balancer_forwarding_rules_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **load_balancer_id** | **String** | The [Load Balancer id](#operation/list-load-balancers). |  |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListLoadBalancerForwardingRules200Response**](ListLoadBalancerForwardingRules200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_load_balancers

> <ListLoadBalancers200Response> list_load_balancers(opts)

List Load Balancers

List the Load Balancers in your account.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::LoadBalancerApi.new
opts = {
  per_page: 56, # Integer | Number of items requested per page. Default is 100 and Max is 500. 
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Load Balancers
  result = api_instance.list_load_balancers(opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->list_load_balancers: #{e}"
end
```

#### Using the list_load_balancers_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ListLoadBalancers200Response>, Integer, Hash)> list_load_balancers_with_http_info(opts)

```ruby
begin
  # List Load Balancers
  data, status_code, headers = api_instance.list_load_balancers_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ListLoadBalancers200Response>
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->list_load_balancers_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **per_page** | **Integer** | Number of items requested per page. Default is 100 and Max is 500.  | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**ListLoadBalancers200Response**](ListLoadBalancers200Response.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_loadbalancer_firewall_rules

> <LoadbalancerFirewallRule> list_loadbalancer_firewall_rules(loadbalancer_id, opts)

List Firewall Rules

List the firewall rules for a Load Balancer.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::LoadBalancerApi.new
loadbalancer_id = 'loadbalancer_id_example' # String | 
opts = {
  per_page: 'per_page_example', # String | Number of items requested per page. Default is 100 and Max is 500.
  cursor: 'cursor_example' # String | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
}

begin
  # List Firewall Rules
  result = api_instance.list_loadbalancer_firewall_rules(loadbalancer_id, opts)
  p result
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->list_loadbalancer_firewall_rules: #{e}"
end
```

#### Using the list_loadbalancer_firewall_rules_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<LoadbalancerFirewallRule>, Integer, Hash)> list_loadbalancer_firewall_rules_with_http_info(loadbalancer_id, opts)

```ruby
begin
  # List Firewall Rules
  data, status_code, headers = api_instance.list_loadbalancer_firewall_rules_with_http_info(loadbalancer_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <LoadbalancerFirewallRule>
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->list_loadbalancer_firewall_rules_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **loadbalancer_id** | **String** |  |  |
| **per_page** | **String** | Number of items requested per page. Default is 100 and Max is 500. | [optional] |
| **cursor** | **String** | Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination). | [optional] |

### Return type

[**LoadbalancerFirewallRule**](LoadbalancerFirewallRule.md)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_load_balancer

> update_load_balancer(load_balancer_id, opts)

Update Load Balancer

Update information for a Load Balancer. All attributes are optional. If not set, the attributes will retain their original values.

### Examples

```ruby
require 'time'
require 'vult_ruby'
# setup authorization
VultRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = VultRuby::LoadBalancerApi.new
load_balancer_id = 'load_balancer_id_example' # String | The [Load Balancer id](#operation/list-load-balancers).
opts = {
  update_load_balancer_request: VultRuby::UpdateLoadBalancerRequest.new # UpdateLoadBalancerRequest | Include a JSON object in the request body with a content type of **application/json**.
}

begin
  # Update Load Balancer
  api_instance.update_load_balancer(load_balancer_id, opts)
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->update_load_balancer: #{e}"
end
```

#### Using the update_load_balancer_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_load_balancer_with_http_info(load_balancer_id, opts)

```ruby
begin
  # Update Load Balancer
  data, status_code, headers = api_instance.update_load_balancer_with_http_info(load_balancer_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue VultRuby::ApiError => e
  puts "Error when calling LoadBalancerApi->update_load_balancer_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **load_balancer_id** | **String** | The [Load Balancer id](#operation/list-load-balancers). |  |
| **update_load_balancer_request** | [**UpdateLoadBalancerRequest**](UpdateLoadBalancerRequest.md) | Include a JSON object in the request body with a content type of **application/json**. | [optional] |

### Return type

nil (empty response body)

### Authorization

[API Key](../README.md#API Key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

