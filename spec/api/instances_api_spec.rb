=begin
#Vultr API

## Introduction  The Vultr API v2 is a set of HTTP endpoints that adhere to RESTful design principles and CRUD actions with predictable URIs. It uses standard HTTP response codes, authentication, and verbs. The API has consistent and well-formed JSON requests and responses with cursor-based pagination to simplify list handling. Error messages are descriptive and easy to understand. All functions of the Vultr customer portal are accessible via the API, enabling you to script complex unattended scenarios with any tool fluent in HTTP.  ## Requests  Communicate with the API by making an HTTP request at the correct endpoint. The chosen method determines the action taken.  | Method | Usage | | ------ | ------------- | | DELETE | Use the DELETE method to destroy a resource in your account. If it is not found, the operation will return a 4xx error and an appropriate message. | | GET | To retrieve information about a resource, use the GET method. The data is returned as a JSON object. GET methods are read-only and do not affect any resources. | | PATCH | Some resources support partial modification with PATCH, which modifies specific attributes without updating the entire object representation. | | POST | Issue a POST method to create a new object. Include all needed attributes in the request body encoded as JSON. | | PUT | Use the PUT method to update information about a resource. PUT will set new values on the item without regard to their current values. |  **Rate Limit:** Vultr safeguards the API against bursts of incoming traffic based on the request's IP address to ensure stability for all users. If your application sends more than 30 requests per second, the API may return HTTP status code 429.  ## Response Codes  We use standard HTTP response codes to show the success or failure of requests. Response codes in the 2xx range indicate success, while codes in the 4xx range indicate an error, such as an authorization failure or a malformed request. All 4xx errors will return a JSON response object with an `error` attribute explaining the error. Codes in the 5xx range indicate a server-side problem preventing Vultr from fulfilling your request.  | Response | Description | | ------ | ------------- | | 200 OK | The response contains your requested information. | | 201 Created | Your request was accepted. The resource was created. | | 202 Accepted | Your request was accepted. The resource was created or updated. | | 204 No Content | Your request succeeded, there is no additional information returned. | | 400 Bad Request | Your request was malformed. | | 401 Unauthorized | You did not supply valid authentication credentials. | | 403 Forbidden | You are not allowed to perform that action. | | 404 Not Found | No results were found for your request. | | 429 Too Many Requests | Your request exceeded the API rate limit. | | 500 Internal Server Error | We were unable to perform the request due to server-side problems. |  ## Meta and Pagination  Many API calls will return a `meta` object with paging information.  ### Definitions  | Term | Description | | ------ | ------------- | | **List** | The items returned from the database for your request (not necessarily shown in a single response depending on the **cursor** size). | | **Page** | A subset of the full **list** of items. Choose the size of a **page** with the `per_page` parameter. | | **Total** | The `total` attribute indicates the number of items in the full **list**.| | **Cursor** | Use the `cursor` query parameter to select a next or previous **page**. | | **Next** & **Prev** | Use the `next` and `prev` attributes of the `links` meta object as `cursor` values. |  ### How to use Paging  If your result **list** total exceeds the default **cursor** size (the default depends on the route, but is usually 100 records) or the value defined by the `per_page` query param (when present) the response will be returned to you paginated.  ### Paging Example  > These examples have abbreviated attributes and sample values. Your actual `cursor` values will be encoded alphanumeric strings.  To return a **page** with the first two plans in the List:      curl \"https://api.vultr.com/v2/plans?per_page=2\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  The API returns an object similar to this:      {         \"plans\": [             {                 \"id\": \"vc2-1c-2gb\",                 \"vcpu_count\": 1,                 \"ram\": 2048,                 \"locations\": []             },             {                 \"id\": \"vc2-24c-97gb\",                 \"vcpu_count\": 24,                 \"ram\": 98304,                 \"locations\": []             }         ],         \"meta\": {             \"total\": 19,             \"links\": {                 \"next\": \"WxYzExampleNext\",                 \"prev\": \"WxYzExamplePrev\"             }         }     }  The object contains two plans. The `total` attribute indicates that 19 plans are available in the List. To navigate forward in the **list**, use the `next` value (`WxYzExampleNext` in this example) as your `cursor` query parameter.      curl \"https://api.vultr.com/v2/plans?per_page=2&cursor=WxYzExampleNext\" \\       -X GET       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  Likewise, you can use the example `prev` value `WxYzExamplePrev` to navigate backward.  ## Parameters  You can pass information to the API with three different types of parameters.  ### Path parameters  Some API calls require variable parameters as part of the endpoint path. For example, to retrieve information about a user, supply the `user-id` in the endpoint.      curl \"https://api.vultr.com/v2/users/{user-id}\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  ### Query parameters  Some API calls allow filtering with query parameters. For example, the `/v2/plans` endpoint supports a `type` query parameter. Setting `type=vhf` instructs the API only to return High Frequency Compute plans in the list. You'll find more specifics about valid filters in the endpoint documentation below.      curl \"https://api.vultr.com/v2/plans?type=vhf\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  You can also combine filtering with paging. Use the `per_page` parameter to retreive a subset of vhf plans.      curl \"https://api.vultr.com/v2/plans?type=vhf&per_page=2\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  ### Request Body  PUT, POST, and PATCH methods may include an object in the request body with a content type of **application/json**. The documentation for each endpoint below has more information about the expected object.  ## API Example Conventions  The examples in this documentation use `curl`, a command-line HTTP client, to demonstrate useage. Linux and macOS computers usually have curl installed by default, and it's [available for download](https://curl.se/download.html) on all popular platforms including Windows.  Each example is split across multiple lines with the `\\` character, which is compatible with a `bash` terminal. A typical example looks like this:      curl \"https://api.vultr.com/v2/domains\" \\       -X POST \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\" \\       -H \"Content-Type: application/json\" \\       --data '{         \"domain\" : \"example.com\",         \"ip\" : \"192.0.2.123\"       }'  * The `-X` parameter sets the request method. For consistency, we show the method on all examples, even though it's not explicitly required for GET methods. * The `-H` lines set required HTTP headers. These examples are formatted to expand the VULTR\\_API\\_KEY environment variable for your convenience. * Examples that require a JSON object in the request body pass the required data via the `--data` parameter.  All values in this guide are examples. Do not rely on the OS or Plan IDs listed in this guide; use the appropriate endpoint to retreive values before creating resources. 

The version of the OpenAPI document: 2.0
Contact: support@vultr.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 7.2.0-SNAPSHOT

=end

require 'spec_helper'
require 'json'

# Unit tests for VultRuby::InstancesApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'InstancesApi' do
  before do
    # run before each test
    @api_instance = VultRuby::InstancesApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of InstancesApi' do
    it 'should create an instance of InstancesApi' do
      expect(@api_instance).to be_instance_of(VultRuby::InstancesApi)
    end
  end

  # unit tests for attach_instance_iso
  # Attach ISO to Instance
  # Attach an ISO to an Instance.
  # @param instance_id 
  # @param [Hash] opts the optional parameters
  # @option opts [AttachInstanceIsoRequest] :attach_instance_iso_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [AttachInstanceIso202Response]
  describe 'attach_instance_iso test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for attach_instance_network
  # Attach Private Network to Instance
  # Attach Private Network to an Instance.&lt;br&gt;&lt;br&gt;**Deprecated**: use [Attach VPC to Instance](#operation/attach-instance-vpc) instead.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [AttachInstanceNetworkRequest] :attach_instance_network_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [nil]
  describe 'attach_instance_network test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for attach_instance_vpc
  # Attach VPC to Instance
  # Attach a VPC to an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [AttachInstanceVpcRequest] :attach_instance_vpc_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [nil]
  describe 'attach_instance_vpc test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for attach_instance_vpc2
  # Attach VPC 2.0 Network to Instance
  # Attach a VPC 2.0 Network to an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [AttachInstanceVpc2Request] :attach_instance_vpc2_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [nil]
  describe 'attach_instance_vpc2 test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for create_instance
  # Create Instance
  # Create a new VPS Instance in a &#x60;region&#x60; with the desired &#x60;plan&#x60;. Choose one of the following to deploy the instance:  * &#x60;os_id&#x60; * &#x60;iso_id&#x60; * &#x60;snapshot_id&#x60; * &#x60;app_id&#x60; * &#x60;image_id&#x60;  Supply other attributes as desired.
  # @param [Hash] opts the optional parameters
  # @option opts [CreateInstanceRequest] :create_instance_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [CreateInstance202Response]
  describe 'create_instance test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for create_instance_backup_schedule
  # Set Instance Backup Schedule
  # Set the backup schedule for an Instance in UTC. The &#x60;type&#x60; is required.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [CreateInstanceBackupScheduleRequest] :create_instance_backup_schedule_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [nil]
  describe 'create_instance_backup_schedule test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for create_instance_ipv4
  # Create IPv4
  # Create an IPv4 address for an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [CreateInstanceIpv4Request] :create_instance_ipv4_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [Object]
  describe 'create_instance_ipv4 test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for create_instance_reverse_ipv4
  # Create Instance Reverse IPv4
  # Create a reverse IPv4 entry for an Instance. The &#x60;ip&#x60; and &#x60;reverse&#x60; attributes are required. 
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [CreateInstanceReverseIpv4Request] :create_instance_reverse_ipv4_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [nil]
  describe 'create_instance_reverse_ipv4 test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for create_instance_reverse_ipv6
  # Create Instance Reverse IPv6
  # Create a reverse IPv6 entry for an Instance. The &#x60;ip&#x60; and &#x60;reverse&#x60; attributes are required. IP address must be in full, expanded format.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [CreateInstanceReverseIpv6Request] :create_instance_reverse_ipv6_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [nil]
  describe 'create_instance_reverse_ipv6 test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for delete_instance
  # Delete Instance
  # Delete an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_instance test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for delete_instance_ipv4
  # Delete IPv4 Address
  # Delete an IPv4 address from an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param ipv4 The IPv4 address.
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_instance_ipv4 test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for delete_instance_reverse_ipv6
  # Delete Instance Reverse IPv6
  # Delete the reverse IPv6 for an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param ipv6 The IPv6 address.
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_instance_reverse_ipv6 test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for detach_instance_iso
  # Detach ISO from instance
  # Detach the ISO from an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @return [DetachInstanceIso202Response]
  describe 'detach_instance_iso test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for detach_instance_network
  # Detach Private Network from Instance.
  # Detach Private Network from an Instance.&lt;br&gt;&lt;br&gt;**Deprecated**: use [Detach VPC from Instance](#operation/detach-instance-vpc) instead.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [DetachInstanceNetworkRequest] :detach_instance_network_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [nil]
  describe 'detach_instance_network test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for detach_instance_vpc
  # Detach VPC from Instance
  # Detach a VPC from an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [DetachInstanceVpcRequest] :detach_instance_vpc_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [nil]
  describe 'detach_instance_vpc test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for detach_instance_vpc2
  # Detach VPC 2.0 Network from Instance
  # Detach a VPC 2.0 Network from an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [DetachInstanceVpc2Request] :detach_instance_vpc2_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [nil]
  describe 'detach_instance_vpc2 test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_instance
  # Get Instance
  # Get information about an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @return [CreateInstance202Response]
  describe 'get_instance test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_instance_backup_schedule
  # Get Instance Backup Schedule
  # Get the backup schedule for an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @return [GetInstanceBackupSchedule200Response]
  describe 'get_instance_backup_schedule test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_instance_bandwidth
  # Instance Bandwidth
  # Get bandwidth information about an Instance.&lt;br&gt;&lt;br&gt;The &#x60;bandwidth&#x60; object in a successful response contains objects representing a day in the month. The date is denoted by the nested object keys. Days begin and end in the UTC timezone. The bandwidth utilization data contained within the date object is refreshed periodically. We do not recommend using this endpoint to gather real-time metrics.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :date_range The range of days to include, represented as the number of days relative to the current date. Default 30, Minimum 1 and Max 60.
  # @return [GetBandwidthBaremetal200Response]
  describe 'get_instance_bandwidth test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_instance_ipv4
  # List Instance IPv4 Information
  # List the IPv4 information for an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [Boolean] :public_network If &#x60;true&#x60;, includes information about the public network adapter (such as MAC address) with the &#x60;main_ip&#x60; entry.
  # @option opts [Integer] :per_page Number of items requested per page. Default is 100 and Max is 500. 
  # @option opts [String] :cursor Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
  # @return [GetIpv4Baremetal200Response]
  describe 'get_instance_ipv4 test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_instance_ipv6
  # Get Instance IPv6 Information
  # Get the IPv6 information for an VPS Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @return [GetIpv6Baremetal200Response]
  describe 'get_instance_ipv6 test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_instance_iso_status
  # Get Instance ISO Status
  # Get the ISO status for an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @return [GetInstanceIsoStatus200Response]
  describe 'get_instance_iso_status test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_instance_neighbors
  # Get Instance neighbors
  # Get a list of other instances in the same location as this Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @return [GetInstanceNeighbors200Response]
  describe 'get_instance_neighbors test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_instance_upgrades
  # Get Available Instance Upgrades
  # Get available upgrades for an Instance
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [String] :type Filter upgrade by type:  - all (applications, os, plans) - applications - os - plans
  # @return [GetInstanceUpgrades200Response]
  describe 'get_instance_upgrades test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_instance_userdata
  # Get Instance User Data
  # Get the user-supplied, base64 encoded [user data](https://www.vultr.com/docs/manage-instance-user-data-with-the-vultr-metadata-api/) for an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @return [GetInstanceUserdata200Response]
  describe 'get_instance_userdata test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for halt_instance
  # Halt Instance
  # Halt an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'halt_instance test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for halt_instances
  # Halt Instances
  # Halt Instances.
  # @param [Hash] opts the optional parameters
  # @option opts [HaltInstancesRequest] :halt_instances_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [nil]
  describe 'halt_instances test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for list_instance_ipv6_reverse
  # List Instance IPv6 Reverse
  # List the reverse IPv6 information for an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @return [ListInstanceIpv6Reverse200Response]
  describe 'list_instance_ipv6_reverse test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for list_instance_private_networks
  # List instance Private Networks
  # **Deprecated**: use [List Instance VPCs](#operation/list-instance-vpcs) instead.&lt;br&gt;&lt;br&gt;List the private networks for an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :per_page Number of items requested per page. Default is 100 and Max is 500.
  # @option opts [String] :cursor Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
  # @return [ListInstancePrivateNetworks200Response]
  describe 'list_instance_private_networks test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for list_instance_vpc2
  # List Instance VPC 2.0 Networks
  # List the VPC 2.0 networks for an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :per_page Number of items requested per page. Default is 100 and Max is 500.
  # @option opts [String] :cursor Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
  # @return [ListInstanceVpc2200Response]
  describe 'list_instance_vpc2 test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for list_instance_vpcs
  # List instance VPCs
  # List the VPCs for an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :per_page Number of items requested per page. Default is 100 and Max is 500.
  # @option opts [String] :cursor Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
  # @return [ListInstanceVpcs200Response]
  describe 'list_instance_vpcs test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for list_instances
  # List Instances
  # List all VPS instances in your account.
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :per_page Number of items requested per page. Default is 100 and Max is 500.
  # @option opts [String] :cursor Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
  # @option opts [String] :tag Filter by specific tag.
  # @option opts [String] :label Filter by label.
  # @option opts [String] :main_ip Filter by main ip address.
  # @option opts [String] :region Filter by [Region id](#operation/list-regions).
  # @option opts [String] :firewall_group_id Filter by [Firewall group id](#operation/list-firewall-groups).
  # @return [ListInstances200Response]
  describe 'list_instances test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for post_instances_instance_id_ipv4_reverse_default
  # Set Default Reverse DNS Entry
  # Set a reverse DNS entry for an IPv4 address
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [PostInstancesInstanceIdIpv4ReverseDefaultRequest] :post_instances_instance_id_ipv4_reverse_default_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [nil]
  describe 'post_instances_instance_id_ipv4_reverse_default test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for reboot_instance
  # Reboot Instance
  # Reboot an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'reboot_instance test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for reboot_instances
  # Reboot instances
  # Reboot Instances.
  # @param [Hash] opts the optional parameters
  # @option opts [RebootInstancesRequest] :reboot_instances_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [nil]
  describe 'reboot_instances test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for reinstall_instance
  # Reinstall Instance
  # Reinstall an Instance using an optional &#x60;hostname&#x60;.  **Note:** This action may take a few extra seconds to complete.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [ReinstallInstanceRequest] :reinstall_instance_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [CreateInstance202Response]
  describe 'reinstall_instance test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for restore_instance
  # Restore Instance
  # Restore an Instance from either &#x60;backup_id&#x60; or &#x60;snapshot_id&#x60;.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [RestoreInstanceRequest] :restore_instance_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [RestoreInstance202Response]
  describe 'restore_instance test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for start_instance
  # Start instance
  # Start an Instance.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'start_instance test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for start_instances
  # Start instances
  # Start Instances.
  # @param [Hash] opts the optional parameters
  # @option opts [StartInstancesRequest] :start_instances_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [nil]
  describe 'start_instances test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for update_instance
  # Update Instance
  # Update information for an Instance. All attributes are optional. If not set, the attributes will retain their original values.  **Note:** Changing &#x60;os_id&#x60;, &#x60;app_id&#x60; or &#x60;image_id&#x60; may take a few extra seconds to complete.
  # @param instance_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @option opts [UpdateInstanceRequest] :update_instance_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [CreateInstance202Response]
  describe 'update_instance test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

end
