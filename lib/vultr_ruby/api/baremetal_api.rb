=begin
#Vultr API

## Introduction  The Vultr API v2 is a set of HTTP endpoints that adhere to RESTful design principles and CRUD actions with predictable URIs. It uses standard HTTP response codes, authentication, and verbs. The API has consistent and well-formed JSON requests and responses with cursor-based pagination to simplify list handling. Error messages are descriptive and easy to understand. All functions of the Vultr customer portal are accessible via the API, enabling you to script complex unattended scenarios with any tool fluent in HTTP.  ## Requests  Communicate with the API by making an HTTP request at the correct endpoint. The chosen method determines the action taken.  | Method | Usage | | ------ | ------------- | | DELETE | Use the DELETE method to destroy a resource in your account. If it is not found, the operation will return a 4xx error and an appropriate message. | | GET | To retrieve information about a resource, use the GET method. The data is returned as a JSON object. GET methods are read-only and do not affect any resources. | | PATCH | Some resources support partial modification with PATCH, which modifies specific attributes without updating the entire object representation. | | POST | Issue a POST method to create a new object. Include all needed attributes in the request body encoded as JSON. | | PUT | Use the PUT method to update information about a resource. PUT will set new values on the item without regard to their current values. |  **Rate Limit:** Vultr safeguards the API against bursts of incoming traffic based on the request's IP address to ensure stability for all users. If your application sends more than 30 requests per second, the API may return HTTP status code 429.  ## Response Codes  We use standard HTTP response codes to show the success or failure of requests. Response codes in the 2xx range indicate success, while codes in the 4xx range indicate an error, such as an authorization failure or a malformed request. All 4xx errors will return a JSON response object with an `error` attribute explaining the error. Codes in the 5xx range indicate a server-side problem preventing Vultr from fulfilling your request.  | Response | Description | | ------ | ------------- | | 200 OK | The response contains your requested information. | | 201 Created | Your request was accepted. The resource was created. | | 202 Accepted | Your request was accepted. The resource was created or updated. | | 204 No Content | Your request succeeded, there is no additional information returned. | | 400 Bad Request | Your request was malformed. | | 401 Unauthorized | You did not supply valid authentication credentials. | | 403 Forbidden | You are not allowed to perform that action. | | 404 Not Found | No results were found for your request. | | 429 Too Many Requests | Your request exceeded the API rate limit. | | 500 Internal Server Error | We were unable to perform the request due to server-side problems. |  ## Meta and Pagination  Many API calls will return a `meta` object with paging information.  ### Definitions  | Term | Description | | ------ | ------------- | | **List** | The items returned from the database for your request (not necessarily shown in a single response depending on the **cursor** size). | | **Page** | A subset of the full **list** of items. Choose the size of a **page** with the `per_page` parameter. | | **Total** | The `total` attribute indicates the number of items in the full **list**.| | **Cursor** | Use the `cursor` query parameter to select a next or previous **page**. | | **Next** & **Prev** | Use the `next` and `prev` attributes of the `links` meta object as `cursor` values. |  ### How to use Paging  If your result **list** total exceeds the default **cursor** size (the default depends on the route, but is usually 100 records) or the value defined by the `per_page` query param (when present) the response will be returned to you paginated.  ### Paging Example  > These examples have abbreviated attributes and sample values. Your actual `cursor` values will be encoded alphanumeric strings.  To return a **page** with the first two plans in the List:      curl \"https://api.vultr.com/v2/plans?per_page=2\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  The API returns an object similar to this:      {         \"plans\": [             {                 \"id\": \"vc2-1c-2gb\",                 \"vcpu_count\": 1,                 \"ram\": 2048,                 \"locations\": []             },             {                 \"id\": \"vc2-24c-97gb\",                 \"vcpu_count\": 24,                 \"ram\": 98304,                 \"locations\": []             }         ],         \"meta\": {             \"total\": 19,             \"links\": {                 \"next\": \"WxYzExampleNext\",                 \"prev\": \"WxYzExamplePrev\"             }         }     }  The object contains two plans. The `total` attribute indicates that 19 plans are available in the List. To navigate forward in the **list**, use the `next` value (`WxYzExampleNext` in this example) as your `cursor` query parameter.      curl \"https://api.vultr.com/v2/plans?per_page=2&cursor=WxYzExampleNext\" \\       -X GET       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  Likewise, you can use the example `prev` value `WxYzExamplePrev` to navigate backward.  ## Parameters  You can pass information to the API with three different types of parameters.  ### Path parameters  Some API calls require variable parameters as part of the endpoint path. For example, to retrieve information about a user, supply the `user-id` in the endpoint.      curl \"https://api.vultr.com/v2/users/{user-id}\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  ### Query parameters  Some API calls allow filtering with query parameters. For example, the `/v2/plans` endpoint supports a `type` query parameter. Setting `type=vhf` instructs the API only to return High Frequency Compute plans in the list. You'll find more specifics about valid filters in the endpoint documentation below.      curl \"https://api.vultr.com/v2/plans?type=vhf\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  You can also combine filtering with paging. Use the `per_page` parameter to retreive a subset of vhf plans.      curl \"https://api.vultr.com/v2/plans?type=vhf&per_page=2\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  ### Request Body  PUT, POST, and PATCH methods may include an object in the request body with a content type of **application/json**. The documentation for each endpoint below has more information about the expected object.  ## API Example Conventions  The examples in this documentation use `curl`, a command-line HTTP client, to demonstrate useage. Linux and macOS computers usually have curl installed by default, and it's [available for download](https://curl.se/download.html) on all popular platforms including Windows.  Each example is split across multiple lines with the `\\` character, which is compatible with a `bash` terminal. A typical example looks like this:      curl \"https://api.vultr.com/v2/domains\" \\       -X POST \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\" \\       -H \"Content-Type: application/json\" \\       --data '{         \"domain\" : \"example.com\",         \"ip\" : \"192.0.2.123\"       }'  * The `-X` parameter sets the request method. For consistency, we show the method on all examples, even though it's not explicitly required for GET methods. * The `-H` lines set required HTTP headers. These examples are formatted to expand the VULTR\\_API\\_KEY environment variable for your convenience. * Examples that require a JSON object in the request body pass the required data via the `--data` parameter.  All values in this guide are examples. Do not rely on the OS or Plan IDs listed in this guide; use the appropriate endpoint to retreive values before creating resources. 

The version of the OpenAPI document: 2.0
Contact: support@vultr.com
Generated by: https://openapi-generator.tech
Generator version: 7.9.0-SNAPSHOT

=end

require 'cgi'

module VultrRuby
  class BaremetalApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Attach VPC 2.0 Network to Bare Metal Instance
    # Attach a VPC 2.0 Network to a Bare Metal Instance.
    # @param baremetal_id [String] The [Bare Metal ID](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @option opts [AttachBaremetalsVpc2Request] :attach_baremetals_vpc2_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [nil]
    def attach_baremetals_vpc2(baremetal_id, opts = {})
      attach_baremetals_vpc2_with_http_info(baremetal_id, opts)
      nil
    end

    # Attach VPC 2.0 Network to Bare Metal Instance
    # Attach a VPC 2.0 Network to a Bare Metal Instance.
    # @param baremetal_id [String] The [Bare Metal ID](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @option opts [AttachBaremetalsVpc2Request] :attach_baremetals_vpc2_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def attach_baremetals_vpc2_with_http_info(baremetal_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.attach_baremetals_vpc2 ...'
      end
      # verify the required parameter 'baremetal_id' is set
      if @api_client.config.client_side_validation && baremetal_id.nil?
        fail ArgumentError, "Missing the required parameter 'baremetal_id' when calling BaremetalApi.attach_baremetals_vpc2"
      end
      # resource path
      local_var_path = '/bare-metals/{baremetal-id}/vpc2/attach'.sub('{' + 'baremetal-id' + '}', CGI.escape(baremetal_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'attach_baremetals_vpc2_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.attach_baremetals_vpc2",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#attach_baremetals_vpc2\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create Bare Metal Instance
    # Create a new Bare Metal instance in a `region` with the desired `plan`. Choose one of the following to deploy the instance:  * `os_id` * `snapshot_id` * `app_id` * `image_id`  Supply other attributes as desired.
    # @param [Hash] opts the optional parameters
    # @option opts [CreateBaremetalRequest] :create_baremetal_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [CreateBaremetal202Response]
    def create_baremetal(opts = {})
      data, _status_code, _headers = create_baremetal_with_http_info(opts)
      data
    end

    # Create Bare Metal Instance
    # Create a new Bare Metal instance in a &#x60;region&#x60; with the desired &#x60;plan&#x60;. Choose one of the following to deploy the instance:  * &#x60;os_id&#x60; * &#x60;snapshot_id&#x60; * &#x60;app_id&#x60; * &#x60;image_id&#x60;  Supply other attributes as desired.
    # @param [Hash] opts the optional parameters
    # @option opts [CreateBaremetalRequest] :create_baremetal_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(CreateBaremetal202Response, Integer, Hash)>] CreateBaremetal202Response data, response status code and response headers
    def create_baremetal_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.create_baremetal ...'
      end
      # resource path
      local_var_path = '/bare-metals'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'create_baremetal_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'CreateBaremetal202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.create_baremetal",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#create_baremetal\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete Bare Metal
    # Delete a Bare Metal instance.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_baremetal(baremetal_id, opts = {})
      delete_baremetal_with_http_info(baremetal_id, opts)
      nil
    end

    # Delete Bare Metal
    # Delete a Bare Metal instance.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_baremetal_with_http_info(baremetal_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.delete_baremetal ...'
      end
      # verify the required parameter 'baremetal_id' is set
      if @api_client.config.client_side_validation && baremetal_id.nil?
        fail ArgumentError, "Missing the required parameter 'baremetal_id' when calling BaremetalApi.delete_baremetal"
      end
      # resource path
      local_var_path = '/bare-metals/{baremetal-id}'.sub('{' + 'baremetal-id' + '}', CGI.escape(baremetal_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.delete_baremetal",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#delete_baremetal\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Detach VPC 2.0 Network from Bare Metal Instance
    # Detach a VPC 2.0 Network from an Bare Metal Instance.
    # @param baremetal_id [String] The [bare-metal ID](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @option opts [DetachBaremetalVpc2Request] :detach_baremetal_vpc2_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [nil]
    def detach_baremetal_vpc2(baremetal_id, opts = {})
      detach_baremetal_vpc2_with_http_info(baremetal_id, opts)
      nil
    end

    # Detach VPC 2.0 Network from Bare Metal Instance
    # Detach a VPC 2.0 Network from an Bare Metal Instance.
    # @param baremetal_id [String] The [bare-metal ID](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @option opts [DetachBaremetalVpc2Request] :detach_baremetal_vpc2_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def detach_baremetal_vpc2_with_http_info(baremetal_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.detach_baremetal_vpc2 ...'
      end
      # verify the required parameter 'baremetal_id' is set
      if @api_client.config.client_side_validation && baremetal_id.nil?
        fail ArgumentError, "Missing the required parameter 'baremetal_id' when calling BaremetalApi.detach_baremetal_vpc2"
      end
      # resource path
      local_var_path = '/bare-metals/{baremetal-id}/vpc2/detach'.sub('{' + 'baremetal-id' + '}', CGI.escape(baremetal_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'detach_baremetal_vpc2_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.detach_baremetal_vpc2",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#detach_baremetal_vpc2\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Bare Metal Bandwidth
    # Get bandwidth information for the Bare Metal instance.<br><br>The `bandwidth` object in a successful response contains objects representing a day in the month. The date is denoted by the nested object keys. Days begin and end in the UTC timezone. Bandwidth utilization data contained within the date object is refreshed periodically. We do not recommend using this endpoint to gather real-time metrics.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [GetBandwidthBaremetal200Response]
    def get_bandwidth_baremetal(baremetal_id, opts = {})
      data, _status_code, _headers = get_bandwidth_baremetal_with_http_info(baremetal_id, opts)
      data
    end

    # Bare Metal Bandwidth
    # Get bandwidth information for the Bare Metal instance.&lt;br&gt;&lt;br&gt;The &#x60;bandwidth&#x60; object in a successful response contains objects representing a day in the month. The date is denoted by the nested object keys. Days begin and end in the UTC timezone. Bandwidth utilization data contained within the date object is refreshed periodically. We do not recommend using this endpoint to gather real-time metrics.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetBandwidthBaremetal200Response, Integer, Hash)>] GetBandwidthBaremetal200Response data, response status code and response headers
    def get_bandwidth_baremetal_with_http_info(baremetal_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.get_bandwidth_baremetal ...'
      end
      # verify the required parameter 'baremetal_id' is set
      if @api_client.config.client_side_validation && baremetal_id.nil?
        fail ArgumentError, "Missing the required parameter 'baremetal_id' when calling BaremetalApi.get_bandwidth_baremetal"
      end
      # resource path
      local_var_path = '/bare-metals/{baremetal-id}/bandwidth'.sub('{' + 'baremetal-id' + '}', CGI.escape(baremetal_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetBandwidthBaremetal200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.get_bandwidth_baremetal",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#get_bandwidth_baremetal\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Bare Metal User Data
    # Get the user-supplied, base64 encoded [user data](https://www.vultr.com/docs/manage-instance-user-data-with-the-vultr-metadata-api/) for a Bare Metal.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [GetBareMetalUserdata200Response]
    def get_bare_metal_userdata(baremetal_id, opts = {})
      data, _status_code, _headers = get_bare_metal_userdata_with_http_info(baremetal_id, opts)
      data
    end

    # Get Bare Metal User Data
    # Get the user-supplied, base64 encoded [user data](https://www.vultr.com/docs/manage-instance-user-data-with-the-vultr-metadata-api/) for a Bare Metal.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetBareMetalUserdata200Response, Integer, Hash)>] GetBareMetalUserdata200Response data, response status code and response headers
    def get_bare_metal_userdata_with_http_info(baremetal_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.get_bare_metal_userdata ...'
      end
      # verify the required parameter 'baremetal_id' is set
      if @api_client.config.client_side_validation && baremetal_id.nil?
        fail ArgumentError, "Missing the required parameter 'baremetal_id' when calling BaremetalApi.get_bare_metal_userdata"
      end
      # resource path
      local_var_path = '/bare-metals/{baremetal-id}/user-data'.sub('{' + 'baremetal-id' + '}', CGI.escape(baremetal_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetBareMetalUserdata200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.get_bare_metal_userdata",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#get_bare_metal_userdata\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get VNC URL for a Bare Metal
    # Get the VNC URL for a Bare Metal
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [GetBareMetalVnc200Response]
    def get_bare_metal_vnc(baremetal_id, opts = {})
      data, _status_code, _headers = get_bare_metal_vnc_with_http_info(baremetal_id, opts)
      data
    end

    # Get VNC URL for a Bare Metal
    # Get the VNC URL for a Bare Metal
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetBareMetalVnc200Response, Integer, Hash)>] GetBareMetalVnc200Response data, response status code and response headers
    def get_bare_metal_vnc_with_http_info(baremetal_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.get_bare_metal_vnc ...'
      end
      # verify the required parameter 'baremetal_id' is set
      if @api_client.config.client_side_validation && baremetal_id.nil?
        fail ArgumentError, "Missing the required parameter 'baremetal_id' when calling BaremetalApi.get_bare_metal_vnc"
      end
      # resource path
      local_var_path = '/bare-metals/{baremetal-id}/vnc'.sub('{' + 'baremetal-id' + '}', CGI.escape(baremetal_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetBareMetalVnc200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.get_bare_metal_vnc",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#get_bare_metal_vnc\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Available Bare Metal Upgrades
    # Get available upgrades for a Bare Metal
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @option opts [String] :type Filter upgrade by type:  - all (applications, plans) - applications - os
    # @return [GetBareMetalsUpgrades200Response]
    def get_bare_metals_upgrades(baremetal_id, opts = {})
      data, _status_code, _headers = get_bare_metals_upgrades_with_http_info(baremetal_id, opts)
      data
    end

    # Get Available Bare Metal Upgrades
    # Get available upgrades for a Bare Metal
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @option opts [String] :type Filter upgrade by type:  - all (applications, plans) - applications - os
    # @return [Array<(GetBareMetalsUpgrades200Response, Integer, Hash)>] GetBareMetalsUpgrades200Response data, response status code and response headers
    def get_bare_metals_upgrades_with_http_info(baremetal_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.get_bare_metals_upgrades ...'
      end
      # verify the required parameter 'baremetal_id' is set
      if @api_client.config.client_side_validation && baremetal_id.nil?
        fail ArgumentError, "Missing the required parameter 'baremetal_id' when calling BaremetalApi.get_bare_metals_upgrades"
      end
      # resource path
      local_var_path = '/bare-metals/{baremetal-id}/upgrades'.sub('{' + 'baremetal-id' + '}', CGI.escape(baremetal_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'type'] = opts[:'type'] if !opts[:'type'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetBareMetalsUpgrades200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.get_bare_metals_upgrades",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#get_bare_metals_upgrades\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Bare Metal
    # Get information for a Bare Metal instance.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [GetBaremetal200Response]
    def get_baremetal(baremetal_id, opts = {})
      data, _status_code, _headers = get_baremetal_with_http_info(baremetal_id, opts)
      data
    end

    # Get Bare Metal
    # Get information for a Bare Metal instance.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetBaremetal200Response, Integer, Hash)>] GetBaremetal200Response data, response status code and response headers
    def get_baremetal_with_http_info(baremetal_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.get_baremetal ...'
      end
      # verify the required parameter 'baremetal_id' is set
      if @api_client.config.client_side_validation && baremetal_id.nil?
        fail ArgumentError, "Missing the required parameter 'baremetal_id' when calling BaremetalApi.get_baremetal"
      end
      # resource path
      local_var_path = '/bare-metals/{baremetal-id}'.sub('{' + 'baremetal-id' + '}', CGI.escape(baremetal_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetBaremetal200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.get_baremetal",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#get_baremetal\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Bare Metal IPv4 Addresses
    # Get the IPv4 information for the Bare Metal instance.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [GetIpv4Baremetal200Response]
    def get_ipv4_baremetal(baremetal_id, opts = {})
      data, _status_code, _headers = get_ipv4_baremetal_with_http_info(baremetal_id, opts)
      data
    end

    # Bare Metal IPv4 Addresses
    # Get the IPv4 information for the Bare Metal instance.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetIpv4Baremetal200Response, Integer, Hash)>] GetIpv4Baremetal200Response data, response status code and response headers
    def get_ipv4_baremetal_with_http_info(baremetal_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.get_ipv4_baremetal ...'
      end
      # verify the required parameter 'baremetal_id' is set
      if @api_client.config.client_side_validation && baremetal_id.nil?
        fail ArgumentError, "Missing the required parameter 'baremetal_id' when calling BaremetalApi.get_ipv4_baremetal"
      end
      # resource path
      local_var_path = '/bare-metals/{baremetal-id}/ipv4'.sub('{' + 'baremetal-id' + '}', CGI.escape(baremetal_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetIpv4Baremetal200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.get_ipv4_baremetal",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#get_ipv4_baremetal\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Bare Metal IPv6 Addresses
    # Get the IPv6 information for the Bare Metal instance.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [GetIpv6Baremetal200Response]
    def get_ipv6_baremetal(baremetal_id, opts = {})
      data, _status_code, _headers = get_ipv6_baremetal_with_http_info(baremetal_id, opts)
      data
    end

    # Bare Metal IPv6 Addresses
    # Get the IPv6 information for the Bare Metal instance.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetIpv6Baremetal200Response, Integer, Hash)>] GetIpv6Baremetal200Response data, response status code and response headers
    def get_ipv6_baremetal_with_http_info(baremetal_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.get_ipv6_baremetal ...'
      end
      # verify the required parameter 'baremetal_id' is set
      if @api_client.config.client_side_validation && baremetal_id.nil?
        fail ArgumentError, "Missing the required parameter 'baremetal_id' when calling BaremetalApi.get_ipv6_baremetal"
      end
      # resource path
      local_var_path = '/bare-metals/{baremetal-id}/ipv6'.sub('{' + 'baremetal-id' + '}', CGI.escape(baremetal_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetIpv6Baremetal200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.get_ipv6_baremetal",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#get_ipv6_baremetal\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Halt Bare Metal
    # Halt the Bare Metal instance.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def halt_baremetal(baremetal_id, opts = {})
      halt_baremetal_with_http_info(baremetal_id, opts)
      nil
    end

    # Halt Bare Metal
    # Halt the Bare Metal instance.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def halt_baremetal_with_http_info(baremetal_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.halt_baremetal ...'
      end
      # verify the required parameter 'baremetal_id' is set
      if @api_client.config.client_side_validation && baremetal_id.nil?
        fail ArgumentError, "Missing the required parameter 'baremetal_id' when calling BaremetalApi.halt_baremetal"
      end
      # resource path
      local_var_path = '/bare-metals/{baremetal-id}/halt'.sub('{' + 'baremetal-id' + '}', CGI.escape(baremetal_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.halt_baremetal",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#halt_baremetal\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Halt Bare Metals
    # Halt Bare Metals.
    # @param [Hash] opts the optional parameters
    # @option opts [HaltBaremetalsRequest] :halt_baremetals_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [nil]
    def halt_baremetals(opts = {})
      halt_baremetals_with_http_info(opts)
      nil
    end

    # Halt Bare Metals
    # Halt Bare Metals.
    # @param [Hash] opts the optional parameters
    # @option opts [HaltBaremetalsRequest] :halt_baremetals_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def halt_baremetals_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.halt_baremetals ...'
      end
      # resource path
      local_var_path = '/bare-metals/halt'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'halt_baremetals_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.halt_baremetals",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#halt_baremetals\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Bare Metal Instance VPC 2.0 Networks
    # List the VPC 2.0 networks for a Bare Metal Instance.
    # @param baremetal_id [String] The [Bare Metal ID](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [ListBaremetalVpc2200Response]
    def list_baremetal_vpc2(baremetal_id, opts = {})
      data, _status_code, _headers = list_baremetal_vpc2_with_http_info(baremetal_id, opts)
      data
    end

    # List Bare Metal Instance VPC 2.0 Networks
    # List the VPC 2.0 networks for a Bare Metal Instance.
    # @param baremetal_id [String] The [Bare Metal ID](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [Array<(ListBaremetalVpc2200Response, Integer, Hash)>] ListBaremetalVpc2200Response data, response status code and response headers
    def list_baremetal_vpc2_with_http_info(baremetal_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.list_baremetal_vpc2 ...'
      end
      # verify the required parameter 'baremetal_id' is set
      if @api_client.config.client_side_validation && baremetal_id.nil?
        fail ArgumentError, "Missing the required parameter 'baremetal_id' when calling BaremetalApi.list_baremetal_vpc2"
      end
      # resource path
      local_var_path = '/bare-metals/{baremetal-id}/vpc2'.sub('{' + 'baremetal-id' + '}', CGI.escape(baremetal_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListBaremetalVpc2200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.list_baremetal_vpc2",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#list_baremetal_vpc2\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Bare Metal Instances
    # List all Bare Metal instances in your account.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :per_page Number of items requested per page. Default is 100 and Max is 500. 
    # @option opts [String] :cursor Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
    # @return [ListBaremetals200Response]
    def list_baremetals(opts = {})
      data, _status_code, _headers = list_baremetals_with_http_info(opts)
      data
    end

    # List Bare Metal Instances
    # List all Bare Metal instances in your account.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :per_page Number of items requested per page. Default is 100 and Max is 500. 
    # @option opts [String] :cursor Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
    # @return [Array<(ListBaremetals200Response, Integer, Hash)>] ListBaremetals200Response data, response status code and response headers
    def list_baremetals_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.list_baremetals ...'
      end
      # resource path
      local_var_path = '/bare-metals'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'per_page'] = opts[:'per_page'] if !opts[:'per_page'].nil?
      query_params[:'cursor'] = opts[:'cursor'] if !opts[:'cursor'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListBaremetals200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.list_baremetals",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#list_baremetals\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Reboot Bare Metals
    # Reboot Bare Metals.
    # @param [Hash] opts the optional parameters
    # @option opts [HaltBaremetalsRequest] :halt_baremetals_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [nil]
    def reboot_bare_metals(opts = {})
      reboot_bare_metals_with_http_info(opts)
      nil
    end

    # Reboot Bare Metals
    # Reboot Bare Metals.
    # @param [Hash] opts the optional parameters
    # @option opts [HaltBaremetalsRequest] :halt_baremetals_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def reboot_bare_metals_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.reboot_bare_metals ...'
      end
      # resource path
      local_var_path = '/bare-metals/reboot'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'halt_baremetals_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.reboot_bare_metals",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#reboot_bare_metals\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Reboot Bare Metal
    # Reboot the Bare Metal instance.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def reboot_baremetal(baremetal_id, opts = {})
      reboot_baremetal_with_http_info(baremetal_id, opts)
      nil
    end

    # Reboot Bare Metal
    # Reboot the Bare Metal instance.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def reboot_baremetal_with_http_info(baremetal_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.reboot_baremetal ...'
      end
      # verify the required parameter 'baremetal_id' is set
      if @api_client.config.client_side_validation && baremetal_id.nil?
        fail ArgumentError, "Missing the required parameter 'baremetal_id' when calling BaremetalApi.reboot_baremetal"
      end
      # resource path
      local_var_path = '/bare-metals/{baremetal-id}/reboot'.sub('{' + 'baremetal-id' + '}', CGI.escape(baremetal_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.reboot_baremetal",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#reboot_baremetal\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Reinstall Bare Metal
    # Reinstall the Bare Metal instance using an optional `hostname`.   **Note:** This action may take some time to complete.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @option opts [ReinstallBaremetalRequest] :reinstall_baremetal_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [GetBaremetal200Response]
    def reinstall_baremetal(baremetal_id, opts = {})
      data, _status_code, _headers = reinstall_baremetal_with_http_info(baremetal_id, opts)
      data
    end

    # Reinstall Bare Metal
    # Reinstall the Bare Metal instance using an optional &#x60;hostname&#x60;.   **Note:** This action may take some time to complete.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @option opts [ReinstallBaremetalRequest] :reinstall_baremetal_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(GetBaremetal200Response, Integer, Hash)>] GetBaremetal200Response data, response status code and response headers
    def reinstall_baremetal_with_http_info(baremetal_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.reinstall_baremetal ...'
      end
      # verify the required parameter 'baremetal_id' is set
      if @api_client.config.client_side_validation && baremetal_id.nil?
        fail ArgumentError, "Missing the required parameter 'baremetal_id' when calling BaremetalApi.reinstall_baremetal"
      end
      # resource path
      local_var_path = '/bare-metals/{baremetal-id}/reinstall'.sub('{' + 'baremetal-id' + '}', CGI.escape(baremetal_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'reinstall_baremetal_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'GetBaremetal200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.reinstall_baremetal",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#reinstall_baremetal\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Start Bare Metals
    # Start Bare Metals.
    # @param [Hash] opts the optional parameters
    # @option opts [HaltBaremetalsRequest] :halt_baremetals_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [nil]
    def start_bare_metals(opts = {})
      start_bare_metals_with_http_info(opts)
      nil
    end

    # Start Bare Metals
    # Start Bare Metals.
    # @param [Hash] opts the optional parameters
    # @option opts [HaltBaremetalsRequest] :halt_baremetals_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def start_bare_metals_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.start_bare_metals ...'
      end
      # resource path
      local_var_path = '/bare-metals/start'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'halt_baremetals_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.start_bare_metals",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#start_bare_metals\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Start Bare Metal
    # Start the Bare Metal instance.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def start_baremetal(baremetal_id, opts = {})
      start_baremetal_with_http_info(baremetal_id, opts)
      nil
    end

    # Start Bare Metal
    # Start the Bare Metal instance.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def start_baremetal_with_http_info(baremetal_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.start_baremetal ...'
      end
      # verify the required parameter 'baremetal_id' is set
      if @api_client.config.client_side_validation && baremetal_id.nil?
        fail ArgumentError, "Missing the required parameter 'baremetal_id' when calling BaremetalApi.start_baremetal"
      end
      # resource path
      local_var_path = '/bare-metals/{baremetal-id}/start'.sub('{' + 'baremetal-id' + '}', CGI.escape(baremetal_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.start_baremetal",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#start_baremetal\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Bare Metal
    # Update a Bare Metal instance. All attributes are optional. If not set, the attributes will retain their original values.  **Note:** Changing `os_id`, `app_id` or `image_id` may take a few extra seconds to complete.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateBaremetalRequest] :update_baremetal_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [GetBaremetal200Response]
    def update_baremetal(baremetal_id, opts = {})
      data, _status_code, _headers = update_baremetal_with_http_info(baremetal_id, opts)
      data
    end

    # Update Bare Metal
    # Update a Bare Metal instance. All attributes are optional. If not set, the attributes will retain their original values.  **Note:** Changing &#x60;os_id&#x60;, &#x60;app_id&#x60; or &#x60;image_id&#x60; may take a few extra seconds to complete.
    # @param baremetal_id [String] The [Bare Metal id](#operation/list-baremetals).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateBaremetalRequest] :update_baremetal_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(GetBaremetal200Response, Integer, Hash)>] GetBaremetal200Response data, response status code and response headers
    def update_baremetal_with_http_info(baremetal_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BaremetalApi.update_baremetal ...'
      end
      # verify the required parameter 'baremetal_id' is set
      if @api_client.config.client_side_validation && baremetal_id.nil?
        fail ArgumentError, "Missing the required parameter 'baremetal_id' when calling BaremetalApi.update_baremetal"
      end
      # resource path
      local_var_path = '/bare-metals/{baremetal-id}'.sub('{' + 'baremetal-id' + '}', CGI.escape(baremetal_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'update_baremetal_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'GetBaremetal200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"BaremetalApi.update_baremetal",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BaremetalApi#update_baremetal\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
