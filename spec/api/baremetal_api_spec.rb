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

# Unit tests for VultRuby::BaremetalApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'BaremetalApi' do
  before do
    # run before each test
    @api_instance = VultRuby::BaremetalApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of BaremetalApi' do
    it 'should create an instance of BaremetalApi' do
      expect(@api_instance).to be_instance_of(VultRuby::BaremetalApi)
    end
  end

  # unit tests for attach_baremetals_vpc2
  # Attach VPC 2.0 Network to Bare Metal Instance
  # Attach a VPC 2.0 Network to a Bare Metal Instance.
  # @param baremetal_id The [Bare Metal ID](#operation/list-baremetals).
  # @param [Hash] opts the optional parameters
  # @option opts [AttachBaremetalsVpc2Request] :attach_baremetals_vpc2_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [nil]
  describe 'attach_baremetals_vpc2 test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for create_baremetal
  # Create Bare Metal Instance
  # Create a new Bare Metal instance in a &#x60;region&#x60; with the desired &#x60;plan&#x60;. Choose one of the following to deploy the instance:  * &#x60;os_id&#x60; * &#x60;snapshot_id&#x60; * &#x60;app_id&#x60; * &#x60;image_id&#x60;  Supply other attributes as desired.
  # @param [Hash] opts the optional parameters
  # @option opts [CreateBaremetalRequest] :create_baremetal_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [CreateBaremetal202Response]
  describe 'create_baremetal test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for delete_baremetal
  # Delete Bare Metal
  # Delete a Bare Metal instance.
  # @param baremetal_id The [Bare Metal id](#operation/list-baremetals).
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_baremetal test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for detach_baremetal_vpc2
  # Detach VPC 2.0 Network from Bare Metal Instance
  # Detach a VPC 2.0 Network from an Bare Metal Instance.
  # @param baremetal_id The [bare-metal ID](#operation/list-baremetals).
  # @param [Hash] opts the optional parameters
  # @option opts [DetachBaremetalVpc2Request] :detach_baremetal_vpc2_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [nil]
  describe 'detach_baremetal_vpc2 test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_bandwidth_baremetal
  # Bare Metal Bandwidth
  # Get bandwidth information for the Bare Metal instance.&lt;br&gt;&lt;br&gt;The &#x60;bandwidth&#x60; object in a successful response contains objects representing a day in the month. The date is denoted by the nested object keys. Days begin and end in the UTC timezone. Bandwidth utilization data contained within the date object is refreshed periodically. We do not recommend using this endpoint to gather real-time metrics.
  # @param baremetal_id The [Bare Metal id](#operation/list-baremetals).
  # @param [Hash] opts the optional parameters
  # @return [GetBandwidthBaremetal200Response]
  describe 'get_bandwidth_baremetal test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_bare_metal_userdata
  # Get Bare Metal User Data
  # Get the user-supplied, base64 encoded [user data](https://www.vultr.com/docs/manage-instance-user-data-with-the-vultr-metadata-api/) for a Bare Metal.
  # @param baremetal_id The [Bare Metal id](#operation/list-baremetals).
  # @param [Hash] opts the optional parameters
  # @return [GetBareMetalUserdata200Response]
  describe 'get_bare_metal_userdata test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_bare_metal_vnc
  # Get VNC URL for a Bare Metal
  # Get the VNC URL for a Bare Metal
  # @param baremetal_id The [Bare Metal id](#operation/list-baremetals).
  # @param [Hash] opts the optional parameters
  # @return [GetBareMetalVnc200Response]
  describe 'get_bare_metal_vnc test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_bare_metals_upgrades
  # Get Available Bare Metal Upgrades
  # Get available upgrades for a Bare Metal
  # @param baremetal_id The [Bare Metal id](#operation/list-baremetals).
  # @param [Hash] opts the optional parameters
  # @option opts [String] :type Filter upgrade by type:  - all (applications, plans) - applications - os
  # @return [GetBareMetalsUpgrades200Response]
  describe 'get_bare_metals_upgrades test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_baremetal
  # Get Bare Metal
  # Get information for a Bare Metal instance.
  # @param baremetal_id The [Bare Metal id](#operation/list-baremetals).
  # @param [Hash] opts the optional parameters
  # @return [GetBaremetal200Response]
  describe 'get_baremetal test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_ipv4_baremetal
  # Bare Metal IPv4 Addresses
  # Get the IPv4 information for the Bare Metal instance.
  # @param baremetal_id The [Bare Metal id](#operation/list-baremetals).
  # @param [Hash] opts the optional parameters
  # @return [GetIpv4Baremetal200Response]
  describe 'get_ipv4_baremetal test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_ipv6_baremetal
  # Bare Metal IPv6 Addresses
  # Get the IPv6 information for the Bare Metal instance.
  # @param baremetal_id The [Bare Metal id](#operation/list-baremetals).
  # @param [Hash] opts the optional parameters
  # @return [GetIpv6Baremetal200Response]
  describe 'get_ipv6_baremetal test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for halt_baremetal
  # Halt Bare Metal
  # Halt the Bare Metal instance.
  # @param baremetal_id The [Bare Metal id](#operation/list-baremetals).
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'halt_baremetal test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for halt_baremetals
  # Halt Bare Metals
  # Halt Bare Metals.
  # @param [Hash] opts the optional parameters
  # @option opts [HaltBaremetalsRequest] :halt_baremetals_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [nil]
  describe 'halt_baremetals test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for list_baremetal_vpc2
  # List Bare Metal Instance VPC 2.0 Networks
  # List the VPC 2.0 networks for a Bare Metal Instance.
  # @param baremetal_id The [Bare Metal ID](#operation/list-baremetals).
  # @param [Hash] opts the optional parameters
  # @return [ListBaremetalVpc2200Response]
  describe 'list_baremetal_vpc2 test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for list_baremetals
  # List Bare Metal Instances
  # List all Bare Metal instances in your account.
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :per_page Number of items requested per page. Default is 100 and Max is 500. 
  # @option opts [String] :cursor Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
  # @return [ListBaremetals200Response]
  describe 'list_baremetals test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for reboot_bare_metals
  # Reboot Bare Metals
  # Reboot Bare Metals.
  # @param [Hash] opts the optional parameters
  # @option opts [HaltBaremetalsRequest] :halt_baremetals_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [nil]
  describe 'reboot_bare_metals test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for reboot_baremetal
  # Reboot Bare Metal
  # Reboot the Bare Metal instance.
  # @param baremetal_id The [Bare Metal id](#operation/list-baremetals).
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'reboot_baremetal test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for reinstall_baremetal
  # Reinstall Bare Metal
  # Reinstall the Bare Metal instance using an optional &#x60;hostname&#x60;.   **Note:** This action may take some time to complete.
  # @param baremetal_id The [Bare Metal id](#operation/list-baremetals).
  # @param [Hash] opts the optional parameters
  # @option opts [ReinstallBaremetalRequest] :reinstall_baremetal_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [GetBaremetal200Response]
  describe 'reinstall_baremetal test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for start_bare_metals
  # Start Bare Metals
  # Start Bare Metals.
  # @param [Hash] opts the optional parameters
  # @option opts [HaltBaremetalsRequest] :halt_baremetals_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [nil]
  describe 'start_bare_metals test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for start_baremetal
  # Start Bare Metal
  # Start the Bare Metal instance.
  # @param baremetal_id The [Bare Metal id](#operation/list-baremetals).
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'start_baremetal test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for update_baremetal
  # Update Bare Metal
  # Update a Bare Metal instance. All attributes are optional. If not set, the attributes will retain their original values.  **Note:** Changing &#x60;os_id&#x60;, &#x60;app_id&#x60; or &#x60;image_id&#x60; may take a few extra seconds to complete.
  # @param baremetal_id The [Bare Metal id](#operation/list-baremetals).
  # @param [Hash] opts the optional parameters
  # @option opts [UpdateBaremetalRequest] :update_baremetal_request Include a JSON object in the request body with a content type of **application/json**.
  # @return [GetBaremetal200Response]
  describe 'update_baremetal test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

end
