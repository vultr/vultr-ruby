# vultr_ruby

VultrRuby - the Ruby gem for the Vultr API

# Introduction

The Vultr API v2 is a set of HTTP endpoints that adhere to RESTful design principles and CRUD actions with predictable URIs. It uses standard HTTP response codes, authentication, and verbs. The API has consistent and well-formed JSON requests and responses with cursor-based pagination to simplify list handling. Error messages are descriptive and easy to understand. All functions of the Vultr customer portal are accessible via the API, enabling you to script complex unattended scenarios with any tool fluent in HTTP.

## Requests

Communicate with the API by making an HTTP request at the correct endpoint. The chosen method determines the action taken.

| Method | Usage |
| ------ | ------------- |
| DELETE | Use the DELETE method to destroy a resource in your account. If it is not found, the operation will return a 4xx error and an appropriate message. |
| GET | To retrieve information about a resource, use the GET method. The data is returned as a JSON object. GET methods are read-only and do not affect any resources. |
| PATCH | Some resources support partial modification with PATCH, which modifies specific attributes without updating the entire object representation. |
| POST | Issue a POST method to create a new object. Include all needed attributes in the request body encoded as JSON. |
| PUT | Use the PUT method to update information about a resource. PUT will set new values on the item without regard to their current values. |

**Rate Limit:** Vultr safeguards the API against bursts of incoming traffic based on the request's IP address to ensure stability for all users. If your application sends more than 30 requests per second, the API may return HTTP status code 429.

## Response Codes

We use standard HTTP response codes to show the success or failure of requests. Response codes in the 2xx range indicate success, while codes in the 4xx range indicate an error, such as an authorization failure or a malformed request. All 4xx errors will return a JSON response object with an `error` attribute explaining the error. Codes in the 5xx range indicate a server-side problem preventing Vultr from fulfilling your request.

| Response | Description |
| ------ | ------------- |
| 200 OK | The response contains your requested information. |
| 201 Created | Your request was accepted. The resource was created. |
| 202 Accepted | Your request was accepted. The resource was created or updated. |
| 204 No Content | Your request succeeded, there is no additional information returned. |
| 400 Bad Request | Your request was malformed. |
| 401 Unauthorized | You did not supply valid authentication credentials. |
| 403 Forbidden | You are not allowed to perform that action. |
| 404 Not Found | No results were found for your request. |
| 429 Too Many Requests | Your request exceeded the API rate limit. |
| 500 Internal Server Error | We were unable to perform the request due to server-side problems. |

## Meta and Pagination

Many API calls will return a `meta` object with paging information.

### Definitions

| Term | Description |
| ------ | ------------- |
| **List** | The items returned from the database for your request (not necessarily shown in a single response depending on the **cursor** size). |
| **Page** | A subset of the full **list** of items. Choose the size of a **page** with the `per_page` parameter. |
| **Total** | The `total` attribute indicates the number of items in the full **list**.|
| **Cursor** | Use the `cursor` query parameter to select a next or previous **page**. |
| **Next** & **Prev** | Use the `next` and `prev` attributes of the `links` meta object as `cursor` values. |

### How to use Paging

If your result **list** total exceeds the default **cursor** size (the default depends on the route, but is usually 100 records) or the value defined by the `per_page` query param (when present) the response will be returned to you paginated.

### Paging Example

> These examples have abbreviated attributes and sample values. Your actual `cursor` values will be encoded alphanumeric strings.

To return a **page** with the first two plans in the List:

    curl \"https://api.vultr.com/v2/plans?per_page=2\" \\
      -X GET \\
      -H \"Authorization: Bearer ${VULTR_API_KEY}\"

The API returns an object similar to this:

    {
        \"plans\": [
            {
                \"id\": \"vc2-1c-2gb\",
                \"vcpu_count\": 1,
                \"ram\": 2048,
                \"locations\": []
            },
            {
                \"id\": \"vc2-24c-97gb\",
                \"vcpu_count\": 24,
                \"ram\": 98304,
                \"locations\": []
            }
        ],
        \"meta\": {
            \"total\": 19,
            \"links\": {
                \"next\": \"WxYzExampleNext\",
                \"prev\": \"WxYzExamplePrev\"
            }
        }
    }

The object contains two plans. The `total` attribute indicates that 19 plans are available in the List. To navigate forward in the **list**, use the `next` value (`WxYzExampleNext` in this example) as your `cursor` query parameter.

    curl \"https://api.vultr.com/v2/plans?per_page=2&cursor=WxYzExampleNext\" \\
      -X GET
      -H \"Authorization: Bearer ${VULTR_API_KEY}\"

Likewise, you can use the example `prev` value `WxYzExamplePrev` to navigate backward.

## Parameters

You can pass information to the API with three different types of parameters.

### Path parameters

Some API calls require variable parameters as part of the endpoint path. For example, to retrieve information about a user, supply the `user-id` in the endpoint.

    curl \"https://api.vultr.com/v2/users/{user-id}\" \\
      -X GET \\
      -H \"Authorization: Bearer ${VULTR_API_KEY}\"

### Query parameters

Some API calls allow filtering with query parameters. For example, the `/v2/plans` endpoint supports a `type` query parameter. Setting `type=vhf` instructs the API only to return High Frequency Compute plans in the list. You'll find more specifics about valid filters in the endpoint documentation below.

    curl \"https://api.vultr.com/v2/plans?type=vhf\" \\
      -X GET \\
      -H \"Authorization: Bearer ${VULTR_API_KEY}\"

You can also combine filtering with paging. Use the `per_page` parameter to retreive a subset of vhf plans.

    curl \"https://api.vultr.com/v2/plans?type=vhf&per_page=2\" \\
      -X GET \\
      -H \"Authorization: Bearer ${VULTR_API_KEY}\"

### Request Body

PUT, POST, and PATCH methods may include an object in the request body with a content type of **application/json**. The documentation for each endpoint below has more information about the expected object.

## API Example Conventions

The examples in this documentation use `curl`, a command-line HTTP client, to demonstrate useage. Linux and macOS computers usually have curl installed by default, and it's [available for download](https://curl.se/download.html) on all popular platforms including Windows.

Each example is split across multiple lines with the `\\` character, which is compatible with a `bash` terminal. A typical example looks like this:

    curl \"https://api.vultr.com/v2/domains\" \\
      -X POST \\
      -H \"Authorization: Bearer ${VULTR_API_KEY}\" \\
      -H \"Content-Type: application/json\" \\
      --data '{
        \"domain\" : \"example.com\",
        \"ip\" : \"192.0.2.123\"
      }'

* The `-X` parameter sets the request method. For consistency, we show the method on all examples, even though it's not explicitly required for GET methods.
* The `-H` lines set required HTTP headers. These examples are formatted to expand the VULTR\\_API\\_KEY environment variable for your convenience.
* Examples that require a JSON object in the request body pass the required data via the `--data` parameter.

All values in this guide are examples. Do not rely on the OS or Plan IDs listed in this guide; use the appropriate endpoint to retreive values before creating resources.


This SDK is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: 2.0
- Package version: 1.0.0
- Build package: org.openapitools.codegen.languages.RubyClientCodegen
For more information, please visit [https://www.vultr.com](https://www.vultr.com)

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build vultr_ruby.gemspec
```

Then either install the gem locally:

```shell
gem install ./vultr_ruby-1.0.0.gem
```

(for development, run `gem install --dev ./vultr_ruby-1.0.0.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'vultr_ruby', '~> 1.0.0'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/GIT_USER_ID/GIT_REPO_ID, then add the following in the Gemfile:

    gem 'vultr_ruby', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:

```ruby
# Load the gem
require 'vultr_ruby'

# Setup authorization
VultrRuby.configure do |config|
  # Configure Bearer authorization: API Key
  config.access_token = 'YOUR_BEARER_TOKEN'
  # Configure a proc to get access tokens in lieu of the static access_token configuration
  config.access_token_getter = -> { 'YOUR TOKEN GETTER PROC' } 
end

api_instance = VultrRuby::AccountApi.new

begin
  #Get Account Info
  result = api_instance.get_account
  p result
rescue VultrRuby::ApiError => e
  puts "Exception when calling AccountApi->get_account: #{e}"
end

```

## Documentation for API Endpoints

All URIs are relative to *https://api.vultr.com/v2*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*VultrRuby::AccountApi* | [**get_account**](docs/AccountApi.md#get_account) | **GET** /account | Get Account Info
*VultrRuby::ApplicationApi* | [**list_applications**](docs/ApplicationApi.md#list_applications) | **GET** /applications | List Applications
*VultrRuby::BackupApi* | [**get_backup**](docs/BackupApi.md#get_backup) | **GET** /backups/{backup-id} | Get a Backup
*VultrRuby::BackupApi* | [**list_backups**](docs/BackupApi.md#list_backups) | **GET** /backups | List Backups
*VultrRuby::BaremetalApi* | [**attach_baremetals_vpc2**](docs/BaremetalApi.md#attach_baremetals_vpc2) | **POST** /bare-metals/{baremetal-id}/vpc2/attach | Attach VPC 2.0 Network to Bare Metal Instance
*VultrRuby::BaremetalApi* | [**create_baremetal**](docs/BaremetalApi.md#create_baremetal) | **POST** /bare-metals | Create Bare Metal Instance
*VultrRuby::BaremetalApi* | [**delete_baremetal**](docs/BaremetalApi.md#delete_baremetal) | **DELETE** /bare-metals/{baremetal-id} | Delete Bare Metal
*VultrRuby::BaremetalApi* | [**detach_baremetal_vpc2**](docs/BaremetalApi.md#detach_baremetal_vpc2) | **POST** /bare-metals/{baremetal-id}/vpc2/detach | Detach VPC 2.0 Network from Bare Metal Instance
*VultrRuby::BaremetalApi* | [**get_bandwidth_baremetal**](docs/BaremetalApi.md#get_bandwidth_baremetal) | **GET** /bare-metals/{baremetal-id}/bandwidth | Bare Metal Bandwidth
*VultrRuby::BaremetalApi* | [**get_bare_metal_userdata**](docs/BaremetalApi.md#get_bare_metal_userdata) | **GET** /bare-metals/{baremetal-id}/user-data | Get Bare Metal User Data
*VultrRuby::BaremetalApi* | [**get_bare_metal_vnc**](docs/BaremetalApi.md#get_bare_metal_vnc) | **GET** /bare-metals/{baremetal-id}/vnc | Get VNC URL for a Bare Metal
*VultrRuby::BaremetalApi* | [**get_bare_metals_upgrades**](docs/BaremetalApi.md#get_bare_metals_upgrades) | **GET** /bare-metals/{baremetal-id}/upgrades | Get Available Bare Metal Upgrades
*VultrRuby::BaremetalApi* | [**get_baremetal**](docs/BaremetalApi.md#get_baremetal) | **GET** /bare-metals/{baremetal-id} | Get Bare Metal
*VultrRuby::BaremetalApi* | [**get_ipv4_baremetal**](docs/BaremetalApi.md#get_ipv4_baremetal) | **GET** /bare-metals/{baremetal-id}/ipv4 | Bare Metal IPv4 Addresses
*VultrRuby::BaremetalApi* | [**get_ipv6_baremetal**](docs/BaremetalApi.md#get_ipv6_baremetal) | **GET** /bare-metals/{baremetal-id}/ipv6 | Bare Metal IPv6 Addresses
*VultrRuby::BaremetalApi* | [**halt_baremetal**](docs/BaremetalApi.md#halt_baremetal) | **POST** /bare-metals/{baremetal-id}/halt | Halt Bare Metal
*VultrRuby::BaremetalApi* | [**halt_baremetals**](docs/BaremetalApi.md#halt_baremetals) | **POST** /bare-metals/halt | Halt Bare Metals
*VultrRuby::BaremetalApi* | [**list_baremetal_vpc2**](docs/BaremetalApi.md#list_baremetal_vpc2) | **GET** /bare-metals/{baremetal-id}/vpc2 | List Bare Metal Instance VPC 2.0 Networks
*VultrRuby::BaremetalApi* | [**list_baremetals**](docs/BaremetalApi.md#list_baremetals) | **GET** /bare-metals | List Bare Metal Instances
*VultrRuby::BaremetalApi* | [**reboot_bare_metals**](docs/BaremetalApi.md#reboot_bare_metals) | **POST** /bare-metals/reboot | Reboot Bare Metals
*VultrRuby::BaremetalApi* | [**reboot_baremetal**](docs/BaremetalApi.md#reboot_baremetal) | **POST** /bare-metals/{baremetal-id}/reboot | Reboot Bare Metal
*VultrRuby::BaremetalApi* | [**reinstall_baremetal**](docs/BaremetalApi.md#reinstall_baremetal) | **POST** /bare-metals/{baremetal-id}/reinstall | Reinstall Bare Metal
*VultrRuby::BaremetalApi* | [**start_bare_metals**](docs/BaremetalApi.md#start_bare_metals) | **POST** /bare-metals/start | Start Bare Metals
*VultrRuby::BaremetalApi* | [**start_baremetal**](docs/BaremetalApi.md#start_baremetal) | **POST** /bare-metals/{baremetal-id}/start | Start Bare Metal
*VultrRuby::BaremetalApi* | [**update_baremetal**](docs/BaremetalApi.md#update_baremetal) | **PATCH** /bare-metals/{baremetal-id} | Update Bare Metal
*VultrRuby::BillingApi* | [**get_invoice**](docs/BillingApi.md#get_invoice) | **GET** /billing/invoices/{invoice-id} | Get Invoice
*VultrRuby::BillingApi* | [**get_invoice_items**](docs/BillingApi.md#get_invoice_items) | **GET** /billing/invoices/{invoice-id}/items | Get Invoice Items
*VultrRuby::BillingApi* | [**list_billing_history**](docs/BillingApi.md#list_billing_history) | **GET** /billing/history | List Billing History
*VultrRuby::BillingApi* | [**list_invoices**](docs/BillingApi.md#list_invoices) | **GET** /billing/invoices | List Invoices
*VultrRuby::BlockApi* | [**attach_block**](docs/BlockApi.md#attach_block) | **POST** /blocks/{block-id}/attach | Attach Block Storage
*VultrRuby::BlockApi* | [**create_block**](docs/BlockApi.md#create_block) | **POST** /blocks | Create Block Storage
*VultrRuby::BlockApi* | [**delete_block**](docs/BlockApi.md#delete_block) | **DELETE** /blocks/{block-id} | Delete Block Storage
*VultrRuby::BlockApi* | [**detach_block**](docs/BlockApi.md#detach_block) | **POST** /blocks/{block-id}/detach | Detach Block Storage
*VultrRuby::BlockApi* | [**get_block**](docs/BlockApi.md#get_block) | **GET** /blocks/{block-id} | Get Block Storage
*VultrRuby::BlockApi* | [**list_blocks**](docs/BlockApi.md#list_blocks) | **GET** /blocks | List Block storages
*VultrRuby::BlockApi* | [**update_block**](docs/BlockApi.md#update_block) | **PATCH** /blocks/{block-id} | Update Block Storage
*VultrRuby::ContainerRegistryApi* | [**create_registry**](docs/ContainerRegistryApi.md#create_registry) | **POST** /registry | Create Container Registry
*VultrRuby::ContainerRegistryApi* | [**create_registry_docker_credentials**](docs/ContainerRegistryApi.md#create_registry_docker_credentials) | **OPTIONS** /registry/{registry-id}/docker-credentials?expiry_seconds&#x3D;0&amp;read_write&#x3D;false | Create Docker Credentials
*VultrRuby::ContainerRegistryApi* | [**create_registry_kubernetes_docker_credentials**](docs/ContainerRegistryApi.md#create_registry_kubernetes_docker_credentials) | **OPTIONS** /registry/{registry-id}/docker-credentials/kubernetes?expiry_seconds&#x3D;0&amp;read_write&#x3D;false&amp;base64_encode&#x3D;false | Create Docker Credentials for Kubernetes
*VultrRuby::ContainerRegistryApi* | [**delete_registry**](docs/ContainerRegistryApi.md#delete_registry) | **DELETE** /registry/{registry-id} | Delete Container Registry
*VultrRuby::ContainerRegistryApi* | [**delete_repository**](docs/ContainerRegistryApi.md#delete_repository) | **DELETE** /registry/{registry-id}/repository/{repository-image} | Delete Repository
*VultrRuby::ContainerRegistryApi* | [**list_registries**](docs/ContainerRegistryApi.md#list_registries) | **GET** /registries | List Container Registries
*VultrRuby::ContainerRegistryApi* | [**list_registry_plans**](docs/ContainerRegistryApi.md#list_registry_plans) | **GET** /registry/plan/list | List Registry Plans
*VultrRuby::ContainerRegistryApi* | [**list_registry_regions**](docs/ContainerRegistryApi.md#list_registry_regions) | **GET** /registry/region/list | List Registry Regions
*VultrRuby::ContainerRegistryApi* | [**list_registry_repositories**](docs/ContainerRegistryApi.md#list_registry_repositories) | **GET** /registry/{registry-id}/repositories | List Repositories
*VultrRuby::ContainerRegistryApi* | [**read_registry**](docs/ContainerRegistryApi.md#read_registry) | **GET** /registry/{registry-id} | Read Container Registry
*VultrRuby::ContainerRegistryApi* | [**read_registry_repository**](docs/ContainerRegistryApi.md#read_registry_repository) | **GET** /registry/{registry-id}/repository/{repository-image} | Read Repository
*VultrRuby::ContainerRegistryApi* | [**update_registry**](docs/ContainerRegistryApi.md#update_registry) | **PUT** /registry/{registry-id} | Update Container Registry
*VultrRuby::ContainerRegistryApi* | [**update_repository**](docs/ContainerRegistryApi.md#update_repository) | **PUT** /registry/{registry-id}/repository/{repository-image} | Update Repository
*VultrRuby::DnsApi* | [**create_dns_domain**](docs/DnsApi.md#create_dns_domain) | **POST** /domains | Create DNS Domain
*VultrRuby::DnsApi* | [**create_dns_domain_record**](docs/DnsApi.md#create_dns_domain_record) | **POST** /domains/{dns-domain}/records | Create Record
*VultrRuby::DnsApi* | [**delete_dns_domain**](docs/DnsApi.md#delete_dns_domain) | **DELETE** /domains/{dns-domain} | Delete Domain
*VultrRuby::DnsApi* | [**delete_dns_domain_record**](docs/DnsApi.md#delete_dns_domain_record) | **DELETE** /domains/{dns-domain}/records/{record-id} | Delete Record
*VultrRuby::DnsApi* | [**get_dns_domain**](docs/DnsApi.md#get_dns_domain) | **GET** /domains/{dns-domain} | Get DNS Domain
*VultrRuby::DnsApi* | [**get_dns_domain_dnssec**](docs/DnsApi.md#get_dns_domain_dnssec) | **GET** /domains/{dns-domain}/dnssec | Get DNSSec Info
*VultrRuby::DnsApi* | [**get_dns_domain_record**](docs/DnsApi.md#get_dns_domain_record) | **GET** /domains/{dns-domain}/records/{record-id} | Get Record
*VultrRuby::DnsApi* | [**get_dns_domain_soa**](docs/DnsApi.md#get_dns_domain_soa) | **GET** /domains/{dns-domain}/soa | Get SOA information
*VultrRuby::DnsApi* | [**list_dns_domain_records**](docs/DnsApi.md#list_dns_domain_records) | **GET** /domains/{dns-domain}/records | List Records
*VultrRuby::DnsApi* | [**list_dns_domains**](docs/DnsApi.md#list_dns_domains) | **GET** /domains | List DNS Domains
*VultrRuby::DnsApi* | [**update_dns_domain**](docs/DnsApi.md#update_dns_domain) | **PUT** /domains/{dns-domain} | Update a DNS Domain
*VultrRuby::DnsApi* | [**update_dns_domain_record**](docs/DnsApi.md#update_dns_domain_record) | **PATCH** /domains/{dns-domain}/records/{record-id} | Update Record
*VultrRuby::DnsApi* | [**update_dns_domain_soa**](docs/DnsApi.md#update_dns_domain_soa) | **PATCH** /domains/{dns-domain}/soa | Update SOA information
*VultrRuby::FirewallApi* | [**create_firewall_group**](docs/FirewallApi.md#create_firewall_group) | **POST** /firewalls | Create Firewall Group
*VultrRuby::FirewallApi* | [**delete_firewall_group**](docs/FirewallApi.md#delete_firewall_group) | **DELETE** /firewalls/{firewall-group-id} | Delete Firewall Group
*VultrRuby::FirewallApi* | [**delete_firewall_group_rule**](docs/FirewallApi.md#delete_firewall_group_rule) | **DELETE** /firewalls/{firewall-group-id}/rules/{firewall-rule-id} | Delete Firewall Rule
*VultrRuby::FirewallApi* | [**get_firewall_group**](docs/FirewallApi.md#get_firewall_group) | **GET** /firewalls/{firewall-group-id} | Get Firewall Group
*VultrRuby::FirewallApi* | [**get_firewall_group_rule**](docs/FirewallApi.md#get_firewall_group_rule) | **GET** /firewalls/{firewall-group-id}/rules/{firewall-rule-id} | Get Firewall Rule
*VultrRuby::FirewallApi* | [**list_firewall_group_rules**](docs/FirewallApi.md#list_firewall_group_rules) | **GET** /firewalls/{firewall-group-id}/rules | List Firewall Rules
*VultrRuby::FirewallApi* | [**list_firewall_groups**](docs/FirewallApi.md#list_firewall_groups) | **GET** /firewalls | List Firewall Groups
*VultrRuby::FirewallApi* | [**post_firewalls_firewall_group_id_rules**](docs/FirewallApi.md#post_firewalls_firewall_group_id_rules) | **POST** /firewalls/{firewall-group-id}/rules | Create Firewall Rules
*VultrRuby::FirewallApi* | [**update_firewall_group**](docs/FirewallApi.md#update_firewall_group) | **PUT** /firewalls/{firewall-group-id} | Update Firewall Group
*VultrRuby::InstancesApi* | [**attach_instance_iso**](docs/InstancesApi.md#attach_instance_iso) | **POST** /instances/{instance-id}/iso/attach | Attach ISO to Instance
*VultrRuby::InstancesApi* | [**attach_instance_network**](docs/InstancesApi.md#attach_instance_network) | **POST** /instances/{instance-id}/private-networks/attach | Attach Private Network to Instance
*VultrRuby::InstancesApi* | [**attach_instance_vpc**](docs/InstancesApi.md#attach_instance_vpc) | **POST** /instances/{instance-id}/vpcs/attach | Attach VPC to Instance
*VultrRuby::InstancesApi* | [**attach_instance_vpc2**](docs/InstancesApi.md#attach_instance_vpc2) | **POST** /instances/{instance-id}/vpc2/attach | Attach VPC 2.0 Network to Instance
*VultrRuby::InstancesApi* | [**create_instance**](docs/InstancesApi.md#create_instance) | **POST** /instances | Create Instance
*VultrRuby::InstancesApi* | [**create_instance_backup_schedule**](docs/InstancesApi.md#create_instance_backup_schedule) | **POST** /instances/{instance-id}/backup-schedule | Set Instance Backup Schedule
*VultrRuby::InstancesApi* | [**create_instance_ipv4**](docs/InstancesApi.md#create_instance_ipv4) | **POST** /instances/{instance-id}/ipv4 | Create IPv4
*VultrRuby::InstancesApi* | [**create_instance_reverse_ipv4**](docs/InstancesApi.md#create_instance_reverse_ipv4) | **POST** /instances/{instance-id}/ipv4/reverse | Create Instance Reverse IPv4
*VultrRuby::InstancesApi* | [**create_instance_reverse_ipv6**](docs/InstancesApi.md#create_instance_reverse_ipv6) | **POST** /instances/{instance-id}/ipv6/reverse | Create Instance Reverse IPv6
*VultrRuby::InstancesApi* | [**delete_instance**](docs/InstancesApi.md#delete_instance) | **DELETE** /instances/{instance-id} | Delete Instance
*VultrRuby::InstancesApi* | [**delete_instance_ipv4**](docs/InstancesApi.md#delete_instance_ipv4) | **DELETE** /instances/{instance-id}/ipv4/{ipv4} | Delete IPv4 Address
*VultrRuby::InstancesApi* | [**delete_instance_reverse_ipv6**](docs/InstancesApi.md#delete_instance_reverse_ipv6) | **DELETE** /instances/{instance-id}/ipv6/reverse/{ipv6} | Delete Instance Reverse IPv6
*VultrRuby::InstancesApi* | [**detach_instance_iso**](docs/InstancesApi.md#detach_instance_iso) | **POST** /instances/{instance-id}/iso/detach | Detach ISO from instance
*VultrRuby::InstancesApi* | [**detach_instance_network**](docs/InstancesApi.md#detach_instance_network) | **POST** /instances/{instance-id}/private-networks/detach | Detach Private Network from Instance.
*VultrRuby::InstancesApi* | [**detach_instance_vpc**](docs/InstancesApi.md#detach_instance_vpc) | **POST** /instances/{instance-id}/vpcs/detach | Detach VPC from Instance
*VultrRuby::InstancesApi* | [**detach_instance_vpc2**](docs/InstancesApi.md#detach_instance_vpc2) | **POST** /instances/{instance-id}/vpc2/detach | Detach VPC 2.0 Network from Instance
*VultrRuby::InstancesApi* | [**get_instance**](docs/InstancesApi.md#get_instance) | **GET** /instances/{instance-id} | Get Instance
*VultrRuby::InstancesApi* | [**get_instance_backup_schedule**](docs/InstancesApi.md#get_instance_backup_schedule) | **GET** /instances/{instance-id}/backup-schedule | Get Instance Backup Schedule
*VultrRuby::InstancesApi* | [**get_instance_bandwidth**](docs/InstancesApi.md#get_instance_bandwidth) | **GET** /instances/{instance-id}/bandwidth | Instance Bandwidth
*VultrRuby::InstancesApi* | [**get_instance_ipv4**](docs/InstancesApi.md#get_instance_ipv4) | **GET** /instances/{instance-id}/ipv4 | List Instance IPv4 Information
*VultrRuby::InstancesApi* | [**get_instance_ipv6**](docs/InstancesApi.md#get_instance_ipv6) | **GET** /instances/{instance-id}/ipv6 | Get Instance IPv6 Information
*VultrRuby::InstancesApi* | [**get_instance_iso_status**](docs/InstancesApi.md#get_instance_iso_status) | **GET** /instances/{instance-id}/iso | Get Instance ISO Status
*VultrRuby::InstancesApi* | [**get_instance_neighbors**](docs/InstancesApi.md#get_instance_neighbors) | **GET** /instances/{instance-id}/neighbors | Get Instance neighbors
*VultrRuby::InstancesApi* | [**get_instance_upgrades**](docs/InstancesApi.md#get_instance_upgrades) | **GET** /instances/{instance-id}/upgrades | Get Available Instance Upgrades
*VultrRuby::InstancesApi* | [**get_instance_userdata**](docs/InstancesApi.md#get_instance_userdata) | **GET** /instances/{instance-id}/user-data | Get Instance User Data
*VultrRuby::InstancesApi* | [**halt_instance**](docs/InstancesApi.md#halt_instance) | **POST** /instances/{instance-id}/halt | Halt Instance
*VultrRuby::InstancesApi* | [**halt_instances**](docs/InstancesApi.md#halt_instances) | **POST** /instances/halt | Halt Instances
*VultrRuby::InstancesApi* | [**list_instance_ipv6_reverse**](docs/InstancesApi.md#list_instance_ipv6_reverse) | **GET** /instances/{instance-id}/ipv6/reverse | List Instance IPv6 Reverse
*VultrRuby::InstancesApi* | [**list_instance_private_networks**](docs/InstancesApi.md#list_instance_private_networks) | **GET** /instances/{instance-id}/private-networks | List instance Private Networks
*VultrRuby::InstancesApi* | [**list_instance_vpc2**](docs/InstancesApi.md#list_instance_vpc2) | **GET** /instances/{instance-id}/vpc2 | List Instance VPC 2.0 Networks
*VultrRuby::InstancesApi* | [**list_instance_vpcs**](docs/InstancesApi.md#list_instance_vpcs) | **GET** /instances/{instance-id}/vpcs | List instance VPCs
*VultrRuby::InstancesApi* | [**list_instances**](docs/InstancesApi.md#list_instances) | **GET** /instances | List Instances
*VultrRuby::InstancesApi* | [**post_instances_instance_id_ipv4_reverse_default**](docs/InstancesApi.md#post_instances_instance_id_ipv4_reverse_default) | **POST** /instances/{instance-id}/ipv4/reverse/default | Set Default Reverse DNS Entry
*VultrRuby::InstancesApi* | [**reboot_instance**](docs/InstancesApi.md#reboot_instance) | **POST** /instances/{instance-id}/reboot | Reboot Instance
*VultrRuby::InstancesApi* | [**reboot_instances**](docs/InstancesApi.md#reboot_instances) | **POST** /instances/reboot | Reboot instances
*VultrRuby::InstancesApi* | [**reinstall_instance**](docs/InstancesApi.md#reinstall_instance) | **POST** /instances/{instance-id}/reinstall | Reinstall Instance
*VultrRuby::InstancesApi* | [**restore_instance**](docs/InstancesApi.md#restore_instance) | **POST** /instances/{instance-id}/restore | Restore Instance
*VultrRuby::InstancesApi* | [**start_instance**](docs/InstancesApi.md#start_instance) | **POST** /instances/{instance-id}/start | Start instance
*VultrRuby::InstancesApi* | [**start_instances**](docs/InstancesApi.md#start_instances) | **POST** /instances/start | Start instances
*VultrRuby::InstancesApi* | [**update_instance**](docs/InstancesApi.md#update_instance) | **PATCH** /instances/{instance-id} | Update Instance
*VultrRuby::IsoApi* | [**create_iso**](docs/IsoApi.md#create_iso) | **POST** /iso | Create ISO
*VultrRuby::IsoApi* | [**delete_iso**](docs/IsoApi.md#delete_iso) | **DELETE** /iso/{iso-id} | Delete ISO
*VultrRuby::IsoApi* | [**iso_get**](docs/IsoApi.md#iso_get) | **GET** /iso/{iso-id} | Get ISO
*VultrRuby::IsoApi* | [**list_isos**](docs/IsoApi.md#list_isos) | **GET** /iso | List ISOs
*VultrRuby::IsoApi* | [**list_public_isos**](docs/IsoApi.md#list_public_isos) | **GET** /iso-public | List Public ISOs
*VultrRuby::KubernetesApi* | [**create_kubernetes_cluster**](docs/KubernetesApi.md#create_kubernetes_cluster) | **POST** /kubernetes/clusters | Create Kubernetes Cluster
*VultrRuby::KubernetesApi* | [**create_nodepools**](docs/KubernetesApi.md#create_nodepools) | **POST** /kubernetes/clusters/{vke-id}/node-pools | Create NodePool
*VultrRuby::KubernetesApi* | [**delete_kubernetes_cluster**](docs/KubernetesApi.md#delete_kubernetes_cluster) | **DELETE** /kubernetes/clusters/{vke-id} | Delete Kubernetes Cluster
*VultrRuby::KubernetesApi* | [**delete_kubernetes_cluster_vke_id_delete_with_linked_resources**](docs/KubernetesApi.md#delete_kubernetes_cluster_vke_id_delete_with_linked_resources) | **DELETE** /kubernetes/clusters/{vke-id}/delete-with-linked-resources | Delete VKE Cluster and All Related Resources
*VultrRuby::KubernetesApi* | [**delete_nodepool**](docs/KubernetesApi.md#delete_nodepool) | **DELETE** /kubernetes/clusters/{vke-id}/node-pools/{nodepool-id} | Delete Nodepool
*VultrRuby::KubernetesApi* | [**delete_nodepool_instance**](docs/KubernetesApi.md#delete_nodepool_instance) | **DELETE** /kubernetes/clusters/{vke-id}/node-pools/{nodepool-id}/nodes/{node-id} | Delete NodePool Instance
*VultrRuby::KubernetesApi* | [**get_kubernetes_available_upgrades**](docs/KubernetesApi.md#get_kubernetes_available_upgrades) | **GET** /kubernetes/clusters/{vke-id}/available-upgrades | Get Kubernetes Available Upgrades
*VultrRuby::KubernetesApi* | [**get_kubernetes_clusters**](docs/KubernetesApi.md#get_kubernetes_clusters) | **GET** /kubernetes/clusters/{vke-id} | Get Kubernetes Cluster
*VultrRuby::KubernetesApi* | [**get_kubernetes_clusters_config**](docs/KubernetesApi.md#get_kubernetes_clusters_config) | **GET** /kubernetes/clusters/{vke-id}/config | Get Kubernetes Cluster Kubeconfig
*VultrRuby::KubernetesApi* | [**get_kubernetes_resources**](docs/KubernetesApi.md#get_kubernetes_resources) | **GET** /kubernetes/clusters/{vke-id}/resources | Get Kubernetes Resources
*VultrRuby::KubernetesApi* | [**get_kubernetes_versions**](docs/KubernetesApi.md#get_kubernetes_versions) | **GET** /kubernetes/versions | Get Kubernetes Versions
*VultrRuby::KubernetesApi* | [**get_nodepool**](docs/KubernetesApi.md#get_nodepool) | **GET** /kubernetes/clusters/{vke-id}/node-pools/{nodepool-id} | Get NodePool
*VultrRuby::KubernetesApi* | [**get_nodepools**](docs/KubernetesApi.md#get_nodepools) | **GET** /kubernetes/clusters/{vke-id}/node-pools | List NodePools
*VultrRuby::KubernetesApi* | [**list_kubernetes_clusters**](docs/KubernetesApi.md#list_kubernetes_clusters) | **GET** /kubernetes/clusters | List all Kubernetes Clusters
*VultrRuby::KubernetesApi* | [**recycle_nodepool_instance**](docs/KubernetesApi.md#recycle_nodepool_instance) | **POST** /kubernetes/clusters/{vke-id}/node-pools/{nodepool-id}/nodes/{node-id}/recycle | Recycle a NodePool Instance
*VultrRuby::KubernetesApi* | [**start_kubernetes_cluster_upgrade**](docs/KubernetesApi.md#start_kubernetes_cluster_upgrade) | **POST** /kubernetes/clusters/{vke-id}/upgrades | Start Kubernetes Cluster Upgrade
*VultrRuby::KubernetesApi* | [**update_kubernetes_cluster**](docs/KubernetesApi.md#update_kubernetes_cluster) | **PUT** /kubernetes/clusters/{vke-id} | Update Kubernetes Cluster
*VultrRuby::KubernetesApi* | [**update_nodepool**](docs/KubernetesApi.md#update_nodepool) | **PATCH** /kubernetes/clusters/{vke-id}/node-pools/{nodepool-id} | Update Nodepool
*VultrRuby::LoadBalancerApi* | [**create_load_balancer**](docs/LoadBalancerApi.md#create_load_balancer) | **POST** /load-balancers | Create Load Balancer
*VultrRuby::LoadBalancerApi* | [**create_load_balancer_forwarding_rules**](docs/LoadBalancerApi.md#create_load_balancer_forwarding_rules) | **POST** /load-balancers/{load-balancer-id}/forwarding-rules | Create Forwarding Rule
*VultrRuby::LoadBalancerApi* | [**delete_load_balancer**](docs/LoadBalancerApi.md#delete_load_balancer) | **DELETE** /load-balancers/{load-balancer-id} | Delete Load Balancer
*VultrRuby::LoadBalancerApi* | [**delete_load_balancer_forwarding_rule**](docs/LoadBalancerApi.md#delete_load_balancer_forwarding_rule) | **DELETE** /load-balancers/{load-balancer-id}/forwarding-rules/{forwarding-rule-id} | Delete Forwarding Rule
*VultrRuby::LoadBalancerApi* | [**delete_load_balancer_ssl**](docs/LoadBalancerApi.md#delete_load_balancer_ssl) | **DELETE** /load-balancers/{load-balancer-id}/ssl | Delete Load Balancer SSL
*VultrRuby::LoadBalancerApi* | [**get_load_balancer**](docs/LoadBalancerApi.md#get_load_balancer) | **GET** /load-balancers/{load-balancer-id} | Get Load Balancer
*VultrRuby::LoadBalancerApi* | [**get_load_balancer_forwarding_rule**](docs/LoadBalancerApi.md#get_load_balancer_forwarding_rule) | **GET** /load-balancers/{load-balancer-id}/forwarding-rules/{forwarding-rule-id} | Get Forwarding Rule
*VultrRuby::LoadBalancerApi* | [**get_loadbalancer_firewall_rule**](docs/LoadBalancerApi.md#get_loadbalancer_firewall_rule) | **GET** /load-balancers/{loadbalancer-id}/firewall-rules/{firewall-rule-id} | Get Firewall Rule
*VultrRuby::LoadBalancerApi* | [**list_load_balancer_forwarding_rules**](docs/LoadBalancerApi.md#list_load_balancer_forwarding_rules) | **GET** /load-balancers/{load-balancer-id}/forwarding-rules | List Forwarding Rules
*VultrRuby::LoadBalancerApi* | [**list_load_balancers**](docs/LoadBalancerApi.md#list_load_balancers) | **GET** /load-balancers | List Load Balancers
*VultrRuby::LoadBalancerApi* | [**list_loadbalancer_firewall_rules**](docs/LoadBalancerApi.md#list_loadbalancer_firewall_rules) | **GET** /load-balancers/{loadbalancer-id}/firewall-rules | List Firewall Rules
*VultrRuby::LoadBalancerApi* | [**update_load_balancer**](docs/LoadBalancerApi.md#update_load_balancer) | **PATCH** /load-balancers/{load-balancer-id} | Update Load Balancer
*VultrRuby::ManagedDatabasesApi* | [**create_connection_pool**](docs/ManagedDatabasesApi.md#create_connection_pool) | **POST** /databases/{database-id}/connection-pools | Create Connection Pool
*VultrRuby::ManagedDatabasesApi* | [**create_database**](docs/ManagedDatabasesApi.md#create_database) | **POST** /databases | Create Managed Database
*VultrRuby::ManagedDatabasesApi* | [**create_database_db**](docs/ManagedDatabasesApi.md#create_database_db) | **POST** /databases/{database-id}/dbs | Create Logical Database
*VultrRuby::ManagedDatabasesApi* | [**create_database_user**](docs/ManagedDatabasesApi.md#create_database_user) | **POST** /databases/{database-id}/users | Create Database User
*VultrRuby::ManagedDatabasesApi* | [**database_add_read_replica**](docs/ManagedDatabasesApi.md#database_add_read_replica) | **POST** /databases/{database-id}/read-replica | Add Read-Only Replica
*VultrRuby::ManagedDatabasesApi* | [**database_detach_migration**](docs/ManagedDatabasesApi.md#database_detach_migration) | **DELETE** /databases/{database-id}/migration | Detach Migration
*VultrRuby::ManagedDatabasesApi* | [**database_fork**](docs/ManagedDatabasesApi.md#database_fork) | **POST** /databases/{database-id}/fork | Fork Managed Database
*VultrRuby::ManagedDatabasesApi* | [**database_promote_read_replica**](docs/ManagedDatabasesApi.md#database_promote_read_replica) | **POST** /databases/{database-id}/promote-read-replica | Promote Read-Only Replica
*VultrRuby::ManagedDatabasesApi* | [**database_restore_from_backup**](docs/ManagedDatabasesApi.md#database_restore_from_backup) | **POST** /databases/{database-id}/restore | Restore from Backup
*VultrRuby::ManagedDatabasesApi* | [**database_start_migration**](docs/ManagedDatabasesApi.md#database_start_migration) | **POST** /databases/{database-id}/migration | Start Migration
*VultrRuby::ManagedDatabasesApi* | [**delete_connection_pool**](docs/ManagedDatabasesApi.md#delete_connection_pool) | **DELETE** /databases/{database-id}/connection-pools/{pool-name} | Delete Connection Pool
*VultrRuby::ManagedDatabasesApi* | [**delete_database**](docs/ManagedDatabasesApi.md#delete_database) | **DELETE** /databases/{database-id} | Delete Managed Database
*VultrRuby::ManagedDatabasesApi* | [**delete_database_db**](docs/ManagedDatabasesApi.md#delete_database_db) | **DELETE** /databases/{database-id}/dbs/{db-name} | Delete Logical Database
*VultrRuby::ManagedDatabasesApi* | [**delete_database_user**](docs/ManagedDatabasesApi.md#delete_database_user) | **DELETE** /databases/{database-id}/users/{username} | Delete Database User
*VultrRuby::ManagedDatabasesApi* | [**get_backup_information**](docs/ManagedDatabasesApi.md#get_backup_information) | **GET** /databases/{database-id}/backups | Get Backup Information
*VultrRuby::ManagedDatabasesApi* | [**get_connection_pool**](docs/ManagedDatabasesApi.md#get_connection_pool) | **GET** /databases/{database-id}/connection-pools/{pool-name} | Get Connection Pool
*VultrRuby::ManagedDatabasesApi* | [**get_database**](docs/ManagedDatabasesApi.md#get_database) | **GET** /databases/{database-id} | Get Managed Database
*VultrRuby::ManagedDatabasesApi* | [**get_database_db**](docs/ManagedDatabasesApi.md#get_database_db) | **GET** /databases/{database-id}/dbs/{db-name} | Get Logical Database
*VultrRuby::ManagedDatabasesApi* | [**get_database_usage**](docs/ManagedDatabasesApi.md#get_database_usage) | **GET** /databases/{database-id}/usage | Get Database Usage Information
*VultrRuby::ManagedDatabasesApi* | [**get_database_user**](docs/ManagedDatabasesApi.md#get_database_user) | **GET** /databases/{database-id}/users/{username} | Get Database User
*VultrRuby::ManagedDatabasesApi* | [**list_advanced_options**](docs/ManagedDatabasesApi.md#list_advanced_options) | **GET** /databases/{database-id}/advanced-options | List Advanced Options
*VultrRuby::ManagedDatabasesApi* | [**list_available_versions**](docs/ManagedDatabasesApi.md#list_available_versions) | **GET** /databases/{database-id}/version-upgrade | List Available Versions
*VultrRuby::ManagedDatabasesApi* | [**list_connection_pools**](docs/ManagedDatabasesApi.md#list_connection_pools) | **GET** /databases/{database-id}/connection-pools | List Connection Pools
*VultrRuby::ManagedDatabasesApi* | [**list_database_dbs**](docs/ManagedDatabasesApi.md#list_database_dbs) | **GET** /databases/{database-id}/dbs | List Logical Databases
*VultrRuby::ManagedDatabasesApi* | [**list_database_plans**](docs/ManagedDatabasesApi.md#list_database_plans) | **GET** /databases/plans | List Managed Database Plans
*VultrRuby::ManagedDatabasesApi* | [**list_database_users**](docs/ManagedDatabasesApi.md#list_database_users) | **GET** /databases/{database-id}/users | List Database Users
*VultrRuby::ManagedDatabasesApi* | [**list_databases**](docs/ManagedDatabasesApi.md#list_databases) | **GET** /databases | List Managed Databases
*VultrRuby::ManagedDatabasesApi* | [**list_maintenance_updates**](docs/ManagedDatabasesApi.md#list_maintenance_updates) | **GET** /databases/{database-id}/maintenance | List Maintenance Updates
*VultrRuby::ManagedDatabasesApi* | [**list_service_alerts**](docs/ManagedDatabasesApi.md#list_service_alerts) | **POST** /databases/{database-id}/alerts | List Service Alerts
*VultrRuby::ManagedDatabasesApi* | [**set_database_user_acl**](docs/ManagedDatabasesApi.md#set_database_user_acl) | **PUT** /databases/{database-id}/users/{username}/access-control | Set Database User Access Control
*VultrRuby::ManagedDatabasesApi* | [**start_maintenance_updates**](docs/ManagedDatabasesApi.md#start_maintenance_updates) | **POST** /databases/{database-id}/maintenance | Start Maintenance Updates
*VultrRuby::ManagedDatabasesApi* | [**start_version_upgrade**](docs/ManagedDatabasesApi.md#start_version_upgrade) | **POST** /databases/{database-id}/version-upgrade | Start Version Upgrade
*VultrRuby::ManagedDatabasesApi* | [**update_advanced_options**](docs/ManagedDatabasesApi.md#update_advanced_options) | **PUT** /databases/{database-id}/advanced-options | Update Advanced Options
*VultrRuby::ManagedDatabasesApi* | [**update_connection_pool**](docs/ManagedDatabasesApi.md#update_connection_pool) | **PUT** /databases/{database-id}/connection-pools/{pool-name} | Update Connection Pool
*VultrRuby::ManagedDatabasesApi* | [**update_database**](docs/ManagedDatabasesApi.md#update_database) | **PUT** /databases/{database-id} | Update Managed Database
*VultrRuby::ManagedDatabasesApi* | [**update_database_user**](docs/ManagedDatabasesApi.md#update_database_user) | **PUT** /databases/{database-id}/users/{username} | Update Database User
*VultrRuby::ManagedDatabasesApi* | [**view_migration_status**](docs/ManagedDatabasesApi.md#view_migration_status) | **GET** /databases/{database-id}/migration | Get Migration Status
*VultrRuby::OsApi* | [**list_os**](docs/OsApi.md#list_os) | **GET** /os | List OS
*VultrRuby::PlansApi* | [**list_metal_plans**](docs/PlansApi.md#list_metal_plans) | **GET** /plans-metal | List Bare Metal Plans
*VultrRuby::PlansApi* | [**list_plans**](docs/PlansApi.md#list_plans) | **GET** /plans | List Plans
*VultrRuby::PrivateNetworksApi* | [**create_network**](docs/PrivateNetworksApi.md#create_network) | **POST** /private-networks | Create a Private Network
*VultrRuby::PrivateNetworksApi* | [**delete_network**](docs/PrivateNetworksApi.md#delete_network) | **DELETE** /private-networks/{network-id} | Delete a private network
*VultrRuby::PrivateNetworksApi* | [**get_network**](docs/PrivateNetworksApi.md#get_network) | **GET** /private-networks/{network-id} | Get a private network
*VultrRuby::PrivateNetworksApi* | [**list_networks**](docs/PrivateNetworksApi.md#list_networks) | **GET** /private-networks | List Private Networks
*VultrRuby::PrivateNetworksApi* | [**update_network**](docs/PrivateNetworksApi.md#update_network) | **PUT** /private-networks/{network-id} | Update a Private Network
*VultrRuby::RegionApi* | [**list_available_plans_region**](docs/RegionApi.md#list_available_plans_region) | **GET** /regions/{region-id}/availability | List available plans in region
*VultrRuby::RegionApi* | [**list_regions**](docs/RegionApi.md#list_regions) | **GET** /regions | List Regions
*VultrRuby::ReservedIpApi* | [**attach_reserved_ip**](docs/ReservedIpApi.md#attach_reserved_ip) | **POST** /reserved-ips/{reserved-ip}/attach | Attach Reserved IP
*VultrRuby::ReservedIpApi* | [**convert_reserved_ip**](docs/ReservedIpApi.md#convert_reserved_ip) | **POST** /reserved-ips/convert | Convert Instance IP to Reserved IP
*VultrRuby::ReservedIpApi* | [**create_reserved_ip**](docs/ReservedIpApi.md#create_reserved_ip) | **POST** /reserved-ips | Create Reserved IP
*VultrRuby::ReservedIpApi* | [**delete_reserved_ip**](docs/ReservedIpApi.md#delete_reserved_ip) | **DELETE** /reserved-ips/{reserved-ip} | Delete Reserved IP
*VultrRuby::ReservedIpApi* | [**detach_reserved_ip**](docs/ReservedIpApi.md#detach_reserved_ip) | **POST** /reserved-ips/{reserved-ip}/detach | Detach Reserved IP
*VultrRuby::ReservedIpApi* | [**get_reserved_ip**](docs/ReservedIpApi.md#get_reserved_ip) | **GET** /reserved-ips/{reserved-ip} | Get Reserved IP
*VultrRuby::ReservedIpApi* | [**list_reserved_ips**](docs/ReservedIpApi.md#list_reserved_ips) | **GET** /reserved-ips | List Reserved IPs
*VultrRuby::ReservedIpApi* | [**patch_reserved_ips_reserved_ip**](docs/ReservedIpApi.md#patch_reserved_ips_reserved_ip) | **PATCH** /reserved-ips/{reserved-ip} | Update Reserved IP
*VultrRuby::S3Api* | [**create_object_storage**](docs/S3Api.md#create_object_storage) | **POST** /object-storage | Create Object Storage
*VultrRuby::S3Api* | [**delete_object_storage**](docs/S3Api.md#delete_object_storage) | **DELETE** /object-storage/{object-storage-id} | Delete Object Storage
*VultrRuby::S3Api* | [**get_object_storage**](docs/S3Api.md#get_object_storage) | **GET** /object-storage/{object-storage-id} | Get Object Storage
*VultrRuby::S3Api* | [**list_object_storage_clusters**](docs/S3Api.md#list_object_storage_clusters) | **GET** /object-storage/clusters | Get All Clusters
*VultrRuby::S3Api* | [**list_object_storages**](docs/S3Api.md#list_object_storages) | **GET** /object-storage | List Object Storages
*VultrRuby::S3Api* | [**regenerate_object_storage_keys**](docs/S3Api.md#regenerate_object_storage_keys) | **POST** /object-storage/{object-storage-id}/regenerate-keys | Regenerate Object Storage Keys
*VultrRuby::S3Api* | [**update_object_storage**](docs/S3Api.md#update_object_storage) | **PUT** /object-storage/{object-storage-id} | Update Object Storage
*VultrRuby::SnapshotApi* | [**create_snapshot**](docs/SnapshotApi.md#create_snapshot) | **POST** /snapshots | Create Snapshot
*VultrRuby::SnapshotApi* | [**create_snapshot_create_from_url**](docs/SnapshotApi.md#create_snapshot_create_from_url) | **POST** /snapshots/create-from-url | Create Snapshot from URL
*VultrRuby::SnapshotApi* | [**delete_snapshot**](docs/SnapshotApi.md#delete_snapshot) | **DELETE** /snapshots/{snapshot-id} | Delete Snapshot
*VultrRuby::SnapshotApi* | [**get_snapshot**](docs/SnapshotApi.md#get_snapshot) | **GET** /snapshots/{snapshot-id} | Get Snapshot
*VultrRuby::SnapshotApi* | [**list_snapshots**](docs/SnapshotApi.md#list_snapshots) | **GET** /snapshots | List Snapshots
*VultrRuby::SnapshotApi* | [**put_snapshots_snapshot_id**](docs/SnapshotApi.md#put_snapshots_snapshot_id) | **PUT** /snapshots/{snapshot-id} | Update Snapshot
*VultrRuby::SshApi* | [**create_ssh_key**](docs/SshApi.md#create_ssh_key) | **POST** /ssh-keys | Create SSH key
*VultrRuby::SshApi* | [**delete_ssh_key**](docs/SshApi.md#delete_ssh_key) | **DELETE** /ssh-keys/{ssh-key-id} | Delete SSH Key
*VultrRuby::SshApi* | [**get_ssh_key**](docs/SshApi.md#get_ssh_key) | **GET** /ssh-keys/{ssh-key-id} | Get SSH Key
*VultrRuby::SshApi* | [**list_ssh_keys**](docs/SshApi.md#list_ssh_keys) | **GET** /ssh-keys | List SSH Keys
*VultrRuby::SshApi* | [**update_ssh_key**](docs/SshApi.md#update_ssh_key) | **PATCH** /ssh-keys/{ssh-key-id} | Update SSH Key
*VultrRuby::StartupApi* | [**create_startup_script**](docs/StartupApi.md#create_startup_script) | **POST** /startup-scripts | Create Startup Script
*VultrRuby::StartupApi* | [**delete_startup_script**](docs/StartupApi.md#delete_startup_script) | **DELETE** /startup-scripts/{startup-id} | Delete Startup Script
*VultrRuby::StartupApi* | [**get_startup_script**](docs/StartupApi.md#get_startup_script) | **GET** /startup-scripts/{startup-id} | Get Startup Script
*VultrRuby::StartupApi* | [**list_startup_scripts**](docs/StartupApi.md#list_startup_scripts) | **GET** /startup-scripts | List Startup Scripts
*VultrRuby::StartupApi* | [**update_startup_script**](docs/StartupApi.md#update_startup_script) | **PATCH** /startup-scripts/{startup-id} | Update Startup Script
*VultrRuby::SubaccountApi* | [**create_subaccount**](docs/SubaccountApi.md#create_subaccount) | **POST** /subaccounts | Create Sub-Account
*VultrRuby::SubaccountApi* | [**list_subaccounts**](docs/SubaccountApi.md#list_subaccounts) | **GET** /subaccounts | List Sub-Accounts
*VultrRuby::UsersApi* | [**create_user**](docs/UsersApi.md#create_user) | **POST** /users | Create User
*VultrRuby::UsersApi* | [**delete_user**](docs/UsersApi.md#delete_user) | **DELETE** /users/{user-id} | Delete User
*VultrRuby::UsersApi* | [**get_user**](docs/UsersApi.md#get_user) | **GET** /users/{user-id} | Get User
*VultrRuby::UsersApi* | [**list_users**](docs/UsersApi.md#list_users) | **GET** /users | Get Users
*VultrRuby::UsersApi* | [**update_user**](docs/UsersApi.md#update_user) | **PATCH** /users/{user-id} | Update User
*VultrRuby::VPC2Api* | [**attach_vpc2_nodes**](docs/VPC2Api.md#attach_vpc2_nodes) | **POST** /vpc2/{vpc-id}/nodes/attach | Attach nodes to a VPC 2.0 network
*VultrRuby::VPC2Api* | [**create_vpc2**](docs/VPC2Api.md#create_vpc2) | **POST** /vpc2 | Create a VPC 2.0 network
*VultrRuby::VPC2Api* | [**delete_vpc2**](docs/VPC2Api.md#delete_vpc2) | **DELETE** /vpc2/{vpc-id} | Delete a VPC 2.0 network
*VultrRuby::VPC2Api* | [**detach_vpc2_nodes**](docs/VPC2Api.md#detach_vpc2_nodes) | **POST** /vpc2/{vpc-id}/nodes/detach | Remove nodes from a VPC 2.0 network
*VultrRuby::VPC2Api* | [**get_vpc2**](docs/VPC2Api.md#get_vpc2) | **GET** /vpc2/{vpc-id} | Get a VPC 2.0 network
*VultrRuby::VPC2Api* | [**list_vpc2**](docs/VPC2Api.md#list_vpc2) | **GET** /vpc2 | List VPC 2.0 networks
*VultrRuby::VPC2Api* | [**list_vpc2_nodes**](docs/VPC2Api.md#list_vpc2_nodes) | **GET** /vpc2/{vpc-id}/nodes | Get a list of nodes attached to a VPC 2.0 network
*VultrRuby::VPC2Api* | [**update_vpc2**](docs/VPC2Api.md#update_vpc2) | **PUT** /vpc2/{vpc-id} | Update a VPC 2.0 network
*VultrRuby::VPCsApi* | [**create_vpc**](docs/VPCsApi.md#create_vpc) | **POST** /vpcs | Create a VPC
*VultrRuby::VPCsApi* | [**delete_vpc**](docs/VPCsApi.md#delete_vpc) | **DELETE** /vpcs/{vpc-id} | Delete a VPC
*VultrRuby::VPCsApi* | [**get_vpc**](docs/VPCsApi.md#get_vpc) | **GET** /vpcs/{vpc-id} | Get a VPC
*VultrRuby::VPCsApi* | [**list_vpcs**](docs/VPCsApi.md#list_vpcs) | **GET** /vpcs | List VPCs
*VultrRuby::VPCsApi* | [**update_vpc**](docs/VPCsApi.md#update_vpc) | **PUT** /vpcs/{vpc-id} | Update a VPC


## Documentation for Models

 - [VultrRuby::Account](docs/Account.md)
 - [VultrRuby::Application](docs/Application.md)
 - [VultrRuby::AttachBaremetalsVpc2Request](docs/AttachBaremetalsVpc2Request.md)
 - [VultrRuby::AttachBlockRequest](docs/AttachBlockRequest.md)
 - [VultrRuby::AttachInstanceIso202Response](docs/AttachInstanceIso202Response.md)
 - [VultrRuby::AttachInstanceIso202ResponseIsoStatus](docs/AttachInstanceIso202ResponseIsoStatus.md)
 - [VultrRuby::AttachInstanceIsoRequest](docs/AttachInstanceIsoRequest.md)
 - [VultrRuby::AttachInstanceNetworkRequest](docs/AttachInstanceNetworkRequest.md)
 - [VultrRuby::AttachInstanceVpc2Request](docs/AttachInstanceVpc2Request.md)
 - [VultrRuby::AttachInstanceVpcRequest](docs/AttachInstanceVpcRequest.md)
 - [VultrRuby::AttachReservedIpRequest](docs/AttachReservedIpRequest.md)
 - [VultrRuby::AttachVpc2NodesRequest](docs/AttachVpc2NodesRequest.md)
 - [VultrRuby::Backup](docs/Backup.md)
 - [VultrRuby::BackupSchedule](docs/BackupSchedule.md)
 - [VultrRuby::Bandwidth](docs/Bandwidth.md)
 - [VultrRuby::Baremetal](docs/Baremetal.md)
 - [VultrRuby::BaremetalIpv4](docs/BaremetalIpv4.md)
 - [VultrRuby::BaremetalIpv6](docs/BaremetalIpv6.md)
 - [VultrRuby::Billing](docs/Billing.md)
 - [VultrRuby::Blockstorage](docs/Blockstorage.md)
 - [VultrRuby::Clusters](docs/Clusters.md)
 - [VultrRuby::ConnectionPool](docs/ConnectionPool.md)
 - [VultrRuby::ConvertReservedIpRequest](docs/ConvertReservedIpRequest.md)
 - [VultrRuby::CreateBaremetal202Response](docs/CreateBaremetal202Response.md)
 - [VultrRuby::CreateBaremetalRequest](docs/CreateBaremetalRequest.md)
 - [VultrRuby::CreateBlock202Response](docs/CreateBlock202Response.md)
 - [VultrRuby::CreateBlockRequest](docs/CreateBlockRequest.md)
 - [VultrRuby::CreateConnectionPool202Response](docs/CreateConnectionPool202Response.md)
 - [VultrRuby::CreateConnectionPoolRequest](docs/CreateConnectionPoolRequest.md)
 - [VultrRuby::CreateDatabase202Response](docs/CreateDatabase202Response.md)
 - [VultrRuby::CreateDatabaseDb202Response](docs/CreateDatabaseDb202Response.md)
 - [VultrRuby::CreateDatabaseDbRequest](docs/CreateDatabaseDbRequest.md)
 - [VultrRuby::CreateDatabaseRequest](docs/CreateDatabaseRequest.md)
 - [VultrRuby::CreateDatabaseUser202Response](docs/CreateDatabaseUser202Response.md)
 - [VultrRuby::CreateDatabaseUserRequest](docs/CreateDatabaseUserRequest.md)
 - [VultrRuby::CreateDnsDomain200Response](docs/CreateDnsDomain200Response.md)
 - [VultrRuby::CreateDnsDomainRecord201Response](docs/CreateDnsDomainRecord201Response.md)
 - [VultrRuby::CreateDnsDomainRecordRequest](docs/CreateDnsDomainRecordRequest.md)
 - [VultrRuby::CreateDnsDomainRequest](docs/CreateDnsDomainRequest.md)
 - [VultrRuby::CreateFirewallGroup201Response](docs/CreateFirewallGroup201Response.md)
 - [VultrRuby::CreateFirewallGroupRequest](docs/CreateFirewallGroupRequest.md)
 - [VultrRuby::CreateInstance202Response](docs/CreateInstance202Response.md)
 - [VultrRuby::CreateInstanceBackupScheduleRequest](docs/CreateInstanceBackupScheduleRequest.md)
 - [VultrRuby::CreateInstanceIpv4Request](docs/CreateInstanceIpv4Request.md)
 - [VultrRuby::CreateInstanceRequest](docs/CreateInstanceRequest.md)
 - [VultrRuby::CreateInstanceReverseIpv4Request](docs/CreateInstanceReverseIpv4Request.md)
 - [VultrRuby::CreateInstanceReverseIpv6Request](docs/CreateInstanceReverseIpv6Request.md)
 - [VultrRuby::CreateIso201Response](docs/CreateIso201Response.md)
 - [VultrRuby::CreateIsoRequest](docs/CreateIsoRequest.md)
 - [VultrRuby::CreateKubernetesCluster201Response](docs/CreateKubernetesCluster201Response.md)
 - [VultrRuby::CreateKubernetesClusterRequest](docs/CreateKubernetesClusterRequest.md)
 - [VultrRuby::CreateKubernetesClusterRequestNodePoolsInner](docs/CreateKubernetesClusterRequestNodePoolsInner.md)
 - [VultrRuby::CreateLoadBalancer202Response](docs/CreateLoadBalancer202Response.md)
 - [VultrRuby::CreateLoadBalancerForwardingRulesRequest](docs/CreateLoadBalancerForwardingRulesRequest.md)
 - [VultrRuby::CreateLoadBalancerRequest](docs/CreateLoadBalancerRequest.md)
 - [VultrRuby::CreateLoadBalancerRequestFirewallRulesInner](docs/CreateLoadBalancerRequestFirewallRulesInner.md)
 - [VultrRuby::CreateLoadBalancerRequestForwardingRulesInner](docs/CreateLoadBalancerRequestForwardingRulesInner.md)
 - [VultrRuby::CreateLoadBalancerRequestHealthCheck](docs/CreateLoadBalancerRequestHealthCheck.md)
 - [VultrRuby::CreateLoadBalancerRequestSsl](docs/CreateLoadBalancerRequestSsl.md)
 - [VultrRuby::CreateLoadBalancerRequestStickySession](docs/CreateLoadBalancerRequestStickySession.md)
 - [VultrRuby::CreateNetworkRequest](docs/CreateNetworkRequest.md)
 - [VultrRuby::CreateNodepools201Response](docs/CreateNodepools201Response.md)
 - [VultrRuby::CreateNodepoolsRequest](docs/CreateNodepoolsRequest.md)
 - [VultrRuby::CreateObjectStorage202Response](docs/CreateObjectStorage202Response.md)
 - [VultrRuby::CreateObjectStorageRequest](docs/CreateObjectStorageRequest.md)
 - [VultrRuby::CreateRegistryRequest](docs/CreateRegistryRequest.md)
 - [VultrRuby::CreateReservedIpRequest](docs/CreateReservedIpRequest.md)
 - [VultrRuby::CreateSnapshotCreateFromUrlRequest](docs/CreateSnapshotCreateFromUrlRequest.md)
 - [VultrRuby::CreateSnapshotRequest](docs/CreateSnapshotRequest.md)
 - [VultrRuby::CreateSshKeyRequest](docs/CreateSshKeyRequest.md)
 - [VultrRuby::CreateStartupScriptRequest](docs/CreateStartupScriptRequest.md)
 - [VultrRuby::CreateSubaccount201Response](docs/CreateSubaccount201Response.md)
 - [VultrRuby::CreateSubaccountRequest](docs/CreateSubaccountRequest.md)
 - [VultrRuby::CreateUserRequest](docs/CreateUserRequest.md)
 - [VultrRuby::CreateVpc2Request](docs/CreateVpc2Request.md)
 - [VultrRuby::CreateVpcRequest](docs/CreateVpcRequest.md)
 - [VultrRuby::Database](docs/Database.md)
 - [VultrRuby::DatabaseAddReadReplicaRequest](docs/DatabaseAddReadReplicaRequest.md)
 - [VultrRuby::DatabaseConnections](docs/DatabaseConnections.md)
 - [VultrRuby::DatabaseDb](docs/DatabaseDb.md)
 - [VultrRuby::DatabaseFerretdbCredentials](docs/DatabaseFerretdbCredentials.md)
 - [VultrRuby::DatabaseForkRequest](docs/DatabaseForkRequest.md)
 - [VultrRuby::DatabaseLatestBackup](docs/DatabaseLatestBackup.md)
 - [VultrRuby::DatabaseOldestBackup](docs/DatabaseOldestBackup.md)
 - [VultrRuby::DatabaseRestoreFromBackupRequest](docs/DatabaseRestoreFromBackupRequest.md)
 - [VultrRuby::DatabaseStartMigrationRequest](docs/DatabaseStartMigrationRequest.md)
 - [VultrRuby::DatabaseUsage](docs/DatabaseUsage.md)
 - [VultrRuby::DatabaseUsageCpu](docs/DatabaseUsageCpu.md)
 - [VultrRuby::DatabaseUsageDisk](docs/DatabaseUsageDisk.md)
 - [VultrRuby::DatabaseUsageMemory](docs/DatabaseUsageMemory.md)
 - [VultrRuby::DatabaseUser](docs/DatabaseUser.md)
 - [VultrRuby::DatabaseUserAccessControl](docs/DatabaseUserAccessControl.md)
 - [VultrRuby::DbaasAlerts](docs/DbaasAlerts.md)
 - [VultrRuby::DbaasAvailableOptions](docs/DbaasAvailableOptions.md)
 - [VultrRuby::DbaasMeta](docs/DbaasMeta.md)
 - [VultrRuby::DbaasMigration](docs/DbaasMigration.md)
 - [VultrRuby::DbaasMigrationCredentials](docs/DbaasMigrationCredentials.md)
 - [VultrRuby::DbaasPlan](docs/DbaasPlan.md)
 - [VultrRuby::DetachBaremetalVpc2Request](docs/DetachBaremetalVpc2Request.md)
 - [VultrRuby::DetachBlockRequest](docs/DetachBlockRequest.md)
 - [VultrRuby::DetachInstanceIso202Response](docs/DetachInstanceIso202Response.md)
 - [VultrRuby::DetachInstanceIso202ResponseIsoStatus](docs/DetachInstanceIso202ResponseIsoStatus.md)
 - [VultrRuby::DetachInstanceNetworkRequest](docs/DetachInstanceNetworkRequest.md)
 - [VultrRuby::DetachInstanceVpc2Request](docs/DetachInstanceVpc2Request.md)
 - [VultrRuby::DetachInstanceVpcRequest](docs/DetachInstanceVpcRequest.md)
 - [VultrRuby::DetachVpc2NodesRequest](docs/DetachVpc2NodesRequest.md)
 - [VultrRuby::DnsRecord](docs/DnsRecord.md)
 - [VultrRuby::DnsSoa](docs/DnsSoa.md)
 - [VultrRuby::Domain](docs/Domain.md)
 - [VultrRuby::FirewallGroup](docs/FirewallGroup.md)
 - [VultrRuby::FirewallRule](docs/FirewallRule.md)
 - [VultrRuby::ForwardingRule](docs/ForwardingRule.md)
 - [VultrRuby::GetAccount200Response](docs/GetAccount200Response.md)
 - [VultrRuby::GetBackup200Response](docs/GetBackup200Response.md)
 - [VultrRuby::GetBackupInformation200Response](docs/GetBackupInformation200Response.md)
 - [VultrRuby::GetBandwidthBaremetal200Response](docs/GetBandwidthBaremetal200Response.md)
 - [VultrRuby::GetBandwidthBaremetal200ResponseBandwidth](docs/GetBandwidthBaremetal200ResponseBandwidth.md)
 - [VultrRuby::GetBareMetalUserdata200Response](docs/GetBareMetalUserdata200Response.md)
 - [VultrRuby::GetBareMetalUserdata200ResponseUserData](docs/GetBareMetalUserdata200ResponseUserData.md)
 - [VultrRuby::GetBareMetalVnc200Response](docs/GetBareMetalVnc200Response.md)
 - [VultrRuby::GetBareMetalVnc200ResponseVnc](docs/GetBareMetalVnc200ResponseVnc.md)
 - [VultrRuby::GetBareMetalsUpgrades200Response](docs/GetBareMetalsUpgrades200Response.md)
 - [VultrRuby::GetBareMetalsUpgrades200ResponseUpgrades](docs/GetBareMetalsUpgrades200ResponseUpgrades.md)
 - [VultrRuby::GetBaremetal200Response](docs/GetBaremetal200Response.md)
 - [VultrRuby::GetDatabaseUsage200Response](docs/GetDatabaseUsage200Response.md)
 - [VultrRuby::GetDnsDomainDnssec200Response](docs/GetDnsDomainDnssec200Response.md)
 - [VultrRuby::GetDnsDomainSoa200Response](docs/GetDnsDomainSoa200Response.md)
 - [VultrRuby::GetInstanceBackupSchedule200Response](docs/GetInstanceBackupSchedule200Response.md)
 - [VultrRuby::GetInstanceIsoStatus200Response](docs/GetInstanceIsoStatus200Response.md)
 - [VultrRuby::GetInstanceIsoStatus200ResponseIsoStatus](docs/GetInstanceIsoStatus200ResponseIsoStatus.md)
 - [VultrRuby::GetInstanceNeighbors200Response](docs/GetInstanceNeighbors200Response.md)
 - [VultrRuby::GetInstanceUpgrades200Response](docs/GetInstanceUpgrades200Response.md)
 - [VultrRuby::GetInstanceUpgrades200ResponseUpgrades](docs/GetInstanceUpgrades200ResponseUpgrades.md)
 - [VultrRuby::GetInstanceUserdata200Response](docs/GetInstanceUserdata200Response.md)
 - [VultrRuby::GetInstanceUserdata200ResponseUserData](docs/GetInstanceUserdata200ResponseUserData.md)
 - [VultrRuby::GetInvoice200Response](docs/GetInvoice200Response.md)
 - [VultrRuby::GetInvoiceItems200Response](docs/GetInvoiceItems200Response.md)
 - [VultrRuby::GetInvoiceItems200ResponseInvoiceItemsInner](docs/GetInvoiceItems200ResponseInvoiceItemsInner.md)
 - [VultrRuby::GetInvoiceItems200ResponseMeta](docs/GetInvoiceItems200ResponseMeta.md)
 - [VultrRuby::GetInvoiceItems200ResponseMetaLinks](docs/GetInvoiceItems200ResponseMetaLinks.md)
 - [VultrRuby::GetIpv4Baremetal200Response](docs/GetIpv4Baremetal200Response.md)
 - [VultrRuby::GetIpv6Baremetal200Response](docs/GetIpv6Baremetal200Response.md)
 - [VultrRuby::GetKubernetesAvailableUpgrades200Response](docs/GetKubernetesAvailableUpgrades200Response.md)
 - [VultrRuby::GetKubernetesClustersConfig200Response](docs/GetKubernetesClustersConfig200Response.md)
 - [VultrRuby::GetKubernetesResources200Response](docs/GetKubernetesResources200Response.md)
 - [VultrRuby::GetKubernetesResources200ResponseResources](docs/GetKubernetesResources200ResponseResources.md)
 - [VultrRuby::GetKubernetesResources200ResponseResourcesBlockStorageInner](docs/GetKubernetesResources200ResponseResourcesBlockStorageInner.md)
 - [VultrRuby::GetKubernetesResources200ResponseResourcesLoadBalancerInner](docs/GetKubernetesResources200ResponseResourcesLoadBalancerInner.md)
 - [VultrRuby::GetKubernetesVersions200Response](docs/GetKubernetesVersions200Response.md)
 - [VultrRuby::GetLoadBalancerForwardingRule200Response](docs/GetLoadBalancerForwardingRule200Response.md)
 - [VultrRuby::GetNetwork200Response](docs/GetNetwork200Response.md)
 - [VultrRuby::GetNodepools200Response](docs/GetNodepools200Response.md)
 - [VultrRuby::GetReservedIp200Response](docs/GetReservedIp200Response.md)
 - [VultrRuby::GetSnapshot200Response](docs/GetSnapshot200Response.md)
 - [VultrRuby::GetSshKey200Response](docs/GetSshKey200Response.md)
 - [VultrRuby::GetStartupScript200Response](docs/GetStartupScript200Response.md)
 - [VultrRuby::GetVpc200Response](docs/GetVpc200Response.md)
 - [VultrRuby::GetVpc2200Response](docs/GetVpc2200Response.md)
 - [VultrRuby::HaltBaremetalsRequest](docs/HaltBaremetalsRequest.md)
 - [VultrRuby::HaltInstancesRequest](docs/HaltInstancesRequest.md)
 - [VultrRuby::Instance](docs/Instance.md)
 - [VultrRuby::InstanceV6NetworksInner](docs/InstanceV6NetworksInner.md)
 - [VultrRuby::InstanceVpc2](docs/InstanceVpc2.md)
 - [VultrRuby::Invoice](docs/Invoice.md)
 - [VultrRuby::Iso](docs/Iso.md)
 - [VultrRuby::IsoPublic](docs/IsoPublic.md)
 - [VultrRuby::ListAdvancedOptions200Response](docs/ListAdvancedOptions200Response.md)
 - [VultrRuby::ListApplications200Response](docs/ListApplications200Response.md)
 - [VultrRuby::ListAvailablePlansRegion200Response](docs/ListAvailablePlansRegion200Response.md)
 - [VultrRuby::ListAvailableVersions200Response](docs/ListAvailableVersions200Response.md)
 - [VultrRuby::ListBackups200Response](docs/ListBackups200Response.md)
 - [VultrRuby::ListBaremetalVpc2200Response](docs/ListBaremetalVpc2200Response.md)
 - [VultrRuby::ListBaremetals200Response](docs/ListBaremetals200Response.md)
 - [VultrRuby::ListBillingHistory200Response](docs/ListBillingHistory200Response.md)
 - [VultrRuby::ListBlocks200Response](docs/ListBlocks200Response.md)
 - [VultrRuby::ListConnectionPools200Response](docs/ListConnectionPools200Response.md)
 - [VultrRuby::ListDatabaseDbs200Response](docs/ListDatabaseDbs200Response.md)
 - [VultrRuby::ListDatabasePlans200Response](docs/ListDatabasePlans200Response.md)
 - [VultrRuby::ListDatabaseUsers200Response](docs/ListDatabaseUsers200Response.md)
 - [VultrRuby::ListDatabases200Response](docs/ListDatabases200Response.md)
 - [VultrRuby::ListDnsDomainRecords200Response](docs/ListDnsDomainRecords200Response.md)
 - [VultrRuby::ListDnsDomains200Response](docs/ListDnsDomains200Response.md)
 - [VultrRuby::ListFirewallGroupRules200Response](docs/ListFirewallGroupRules200Response.md)
 - [VultrRuby::ListFirewallGroups200Response](docs/ListFirewallGroups200Response.md)
 - [VultrRuby::ListInstanceIpv6Reverse200Response](docs/ListInstanceIpv6Reverse200Response.md)
 - [VultrRuby::ListInstanceIpv6Reverse200ResponseReverseIpv6sInner](docs/ListInstanceIpv6Reverse200ResponseReverseIpv6sInner.md)
 - [VultrRuby::ListInstancePrivateNetworks200Response](docs/ListInstancePrivateNetworks200Response.md)
 - [VultrRuby::ListInstanceVpc2200Response](docs/ListInstanceVpc2200Response.md)
 - [VultrRuby::ListInstanceVpcs200Response](docs/ListInstanceVpcs200Response.md)
 - [VultrRuby::ListInstances200Response](docs/ListInstances200Response.md)
 - [VultrRuby::ListInvoices200Response](docs/ListInvoices200Response.md)
 - [VultrRuby::ListIsos200Response](docs/ListIsos200Response.md)
 - [VultrRuby::ListKubernetesClusters200Response](docs/ListKubernetesClusters200Response.md)
 - [VultrRuby::ListLoadBalancerForwardingRules200Response](docs/ListLoadBalancerForwardingRules200Response.md)
 - [VultrRuby::ListLoadBalancers200Response](docs/ListLoadBalancers200Response.md)
 - [VultrRuby::ListMaintenanceUpdates200Response](docs/ListMaintenanceUpdates200Response.md)
 - [VultrRuby::ListMetalPlans200Response](docs/ListMetalPlans200Response.md)
 - [VultrRuby::ListNetworks200Response](docs/ListNetworks200Response.md)
 - [VultrRuby::ListObjectStorageClusters200Response](docs/ListObjectStorageClusters200Response.md)
 - [VultrRuby::ListObjectStorages200Response](docs/ListObjectStorages200Response.md)
 - [VultrRuby::ListOs200Response](docs/ListOs200Response.md)
 - [VultrRuby::ListPlans200Response](docs/ListPlans200Response.md)
 - [VultrRuby::ListPublicIsos200Response](docs/ListPublicIsos200Response.md)
 - [VultrRuby::ListRegions200Response](docs/ListRegions200Response.md)
 - [VultrRuby::ListRegistries200Response](docs/ListRegistries200Response.md)
 - [VultrRuby::ListRegistryPlans200Response](docs/ListRegistryPlans200Response.md)
 - [VultrRuby::ListRegistryPlans200ResponsePlans](docs/ListRegistryPlans200ResponsePlans.md)
 - [VultrRuby::ListRegistryRegions200Response](docs/ListRegistryRegions200Response.md)
 - [VultrRuby::ListRegistryRepositories200Response](docs/ListRegistryRepositories200Response.md)
 - [VultrRuby::ListReservedIps200Response](docs/ListReservedIps200Response.md)
 - [VultrRuby::ListServiceAlerts200Response](docs/ListServiceAlerts200Response.md)
 - [VultrRuby::ListServiceAlertsRequest](docs/ListServiceAlertsRequest.md)
 - [VultrRuby::ListSnapshots200Response](docs/ListSnapshots200Response.md)
 - [VultrRuby::ListSshKeys200Response](docs/ListSshKeys200Response.md)
 - [VultrRuby::ListStartupScripts200Response](docs/ListStartupScripts200Response.md)
 - [VultrRuby::ListSubaccounts200Response](docs/ListSubaccounts200Response.md)
 - [VultrRuby::ListUsers200Response](docs/ListUsers200Response.md)
 - [VultrRuby::ListVpc2200Response](docs/ListVpc2200Response.md)
 - [VultrRuby::ListVpcs200Response](docs/ListVpcs200Response.md)
 - [VultrRuby::Loadbalancer](docs/Loadbalancer.md)
 - [VultrRuby::LoadbalancerFirewallRule](docs/LoadbalancerFirewallRule.md)
 - [VultrRuby::LoadbalancerFirewallRulesInner](docs/LoadbalancerFirewallRulesInner.md)
 - [VultrRuby::LoadbalancerForwardRulesInner](docs/LoadbalancerForwardRulesInner.md)
 - [VultrRuby::LoadbalancerGenericInfo](docs/LoadbalancerGenericInfo.md)
 - [VultrRuby::LoadbalancerGenericInfoStickySessions](docs/LoadbalancerGenericInfoStickySessions.md)
 - [VultrRuby::LoadbalancerHealthCheck](docs/LoadbalancerHealthCheck.md)
 - [VultrRuby::Meta](docs/Meta.md)
 - [VultrRuby::MetaLinks](docs/MetaLinks.md)
 - [VultrRuby::Network](docs/Network.md)
 - [VultrRuby::NodepoolInstances](docs/NodepoolInstances.md)
 - [VultrRuby::Nodepools](docs/Nodepools.md)
 - [VultrRuby::ObjectStorage](docs/ObjectStorage.md)
 - [VultrRuby::Os](docs/Os.md)
 - [VultrRuby::PatchReservedIpsReservedIpRequest](docs/PatchReservedIpsReservedIpRequest.md)
 - [VultrRuby::Plans](docs/Plans.md)
 - [VultrRuby::PlansMetal](docs/PlansMetal.md)
 - [VultrRuby::PostFirewallsFirewallGroupIdRules201Response](docs/PostFirewallsFirewallGroupIdRules201Response.md)
 - [VultrRuby::PostFirewallsFirewallGroupIdRulesRequest](docs/PostFirewallsFirewallGroupIdRulesRequest.md)
 - [VultrRuby::PostInstancesInstanceIdIpv4ReverseDefaultRequest](docs/PostInstancesInstanceIdIpv4ReverseDefaultRequest.md)
 - [VultrRuby::PrivateNetworks](docs/PrivateNetworks.md)
 - [VultrRuby::PutSnapshotsSnapshotIdRequest](docs/PutSnapshotsSnapshotIdRequest.md)
 - [VultrRuby::RebootInstancesRequest](docs/RebootInstancesRequest.md)
 - [VultrRuby::RegenerateObjectStorageKeys201Response](docs/RegenerateObjectStorageKeys201Response.md)
 - [VultrRuby::RegenerateObjectStorageKeys201ResponseS3Credentials](docs/RegenerateObjectStorageKeys201ResponseS3Credentials.md)
 - [VultrRuby::Region](docs/Region.md)
 - [VultrRuby::Registry](docs/Registry.md)
 - [VultrRuby::RegistryDockerCredentials](docs/RegistryDockerCredentials.md)
 - [VultrRuby::RegistryDockerCredentialsAuths](docs/RegistryDockerCredentialsAuths.md)
 - [VultrRuby::RegistryDockerCredentialsAuthsRegistryRegionNameVultrcrCom](docs/RegistryDockerCredentialsAuthsRegistryRegionNameVultrcrCom.md)
 - [VultrRuby::RegistryKubernetesDockerCredentials](docs/RegistryKubernetesDockerCredentials.md)
 - [VultrRuby::RegistryKubernetesDockerCredentialsData](docs/RegistryKubernetesDockerCredentialsData.md)
 - [VultrRuby::RegistryKubernetesDockerCredentialsMetadata](docs/RegistryKubernetesDockerCredentialsMetadata.md)
 - [VultrRuby::RegistryMetadata](docs/RegistryMetadata.md)
 - [VultrRuby::RegistryMetadataSubscription](docs/RegistryMetadataSubscription.md)
 - [VultrRuby::RegistryMetadataSubscriptionBilling](docs/RegistryMetadataSubscriptionBilling.md)
 - [VultrRuby::RegistryPlan](docs/RegistryPlan.md)
 - [VultrRuby::RegistryRegion](docs/RegistryRegion.md)
 - [VultrRuby::RegistryRepository](docs/RegistryRepository.md)
 - [VultrRuby::RegistryStorage](docs/RegistryStorage.md)
 - [VultrRuby::RegistryUser](docs/RegistryUser.md)
 - [VultrRuby::ReinstallBaremetalRequest](docs/ReinstallBaremetalRequest.md)
 - [VultrRuby::ReinstallInstanceRequest](docs/ReinstallInstanceRequest.md)
 - [VultrRuby::ReservedIp](docs/ReservedIp.md)
 - [VultrRuby::RestoreInstance202Response](docs/RestoreInstance202Response.md)
 - [VultrRuby::RestoreInstance202ResponseStatus](docs/RestoreInstance202ResponseStatus.md)
 - [VultrRuby::RestoreInstanceRequest](docs/RestoreInstanceRequest.md)
 - [VultrRuby::SetDatabaseUserAclRequest](docs/SetDatabaseUserAclRequest.md)
 - [VultrRuby::Snapshot](docs/Snapshot.md)
 - [VultrRuby::Ssh](docs/Ssh.md)
 - [VultrRuby::StartInstancesRequest](docs/StartInstancesRequest.md)
 - [VultrRuby::StartKubernetesClusterUpgradeRequest](docs/StartKubernetesClusterUpgradeRequest.md)
 - [VultrRuby::StartMaintenanceUpdates200Response](docs/StartMaintenanceUpdates200Response.md)
 - [VultrRuby::StartVersionUpgrade200Response](docs/StartVersionUpgrade200Response.md)
 - [VultrRuby::StartVersionUpgradeRequest](docs/StartVersionUpgradeRequest.md)
 - [VultrRuby::Startup](docs/Startup.md)
 - [VultrRuby::Subaccount](docs/Subaccount.md)
 - [VultrRuby::UpdateAdvancedOptionsRequest](docs/UpdateAdvancedOptionsRequest.md)
 - [VultrRuby::UpdateBaremetalRequest](docs/UpdateBaremetalRequest.md)
 - [VultrRuby::UpdateBlockRequest](docs/UpdateBlockRequest.md)
 - [VultrRuby::UpdateConnectionPoolRequest](docs/UpdateConnectionPoolRequest.md)
 - [VultrRuby::UpdateDatabaseRequest](docs/UpdateDatabaseRequest.md)
 - [VultrRuby::UpdateDatabaseUserRequest](docs/UpdateDatabaseUserRequest.md)
 - [VultrRuby::UpdateDnsDomainRecordRequest](docs/UpdateDnsDomainRecordRequest.md)
 - [VultrRuby::UpdateDnsDomainRequest](docs/UpdateDnsDomainRequest.md)
 - [VultrRuby::UpdateDnsDomainSoaRequest](docs/UpdateDnsDomainSoaRequest.md)
 - [VultrRuby::UpdateFirewallGroupRequest](docs/UpdateFirewallGroupRequest.md)
 - [VultrRuby::UpdateInstanceRequest](docs/UpdateInstanceRequest.md)
 - [VultrRuby::UpdateKubernetesClusterRequest](docs/UpdateKubernetesClusterRequest.md)
 - [VultrRuby::UpdateLoadBalancerRequest](docs/UpdateLoadBalancerRequest.md)
 - [VultrRuby::UpdateLoadBalancerRequestHealthCheck](docs/UpdateLoadBalancerRequestHealthCheck.md)
 - [VultrRuby::UpdateNetworkRequest](docs/UpdateNetworkRequest.md)
 - [VultrRuby::UpdateNodepoolRequest](docs/UpdateNodepoolRequest.md)
 - [VultrRuby::UpdateNodepoolRequest1](docs/UpdateNodepoolRequest1.md)
 - [VultrRuby::UpdateObjectStorageRequest](docs/UpdateObjectStorageRequest.md)
 - [VultrRuby::UpdateRegistryRequest](docs/UpdateRegistryRequest.md)
 - [VultrRuby::UpdateRepositoryRequest](docs/UpdateRepositoryRequest.md)
 - [VultrRuby::UpdateSshKeyRequest](docs/UpdateSshKeyRequest.md)
 - [VultrRuby::UpdateStartupScriptRequest](docs/UpdateStartupScriptRequest.md)
 - [VultrRuby::UpdateUserRequest](docs/UpdateUserRequest.md)
 - [VultrRuby::UpdateVpc2Request](docs/UpdateVpc2Request.md)
 - [VultrRuby::UpdateVpcRequest](docs/UpdateVpcRequest.md)
 - [VultrRuby::User](docs/User.md)
 - [VultrRuby::UserUser](docs/UserUser.md)
 - [VultrRuby::ViewMigrationStatus200Response](docs/ViewMigrationStatus200Response.md)
 - [VultrRuby::VkeCluster](docs/VkeCluster.md)
 - [VultrRuby::Vpc](docs/Vpc.md)
 - [VultrRuby::Vpc2](docs/Vpc2.md)


## Documentation for Authorization


Authentication schemes defined for the API:
### API Key

- **Type**: Bearer authentication

