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
  class InstancesApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Attach ISO to Instance
    # Attach an ISO to an Instance.
    # @param instance_id [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [AttachInstanceIsoRequest] :attach_instance_iso_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [AttachInstanceIso202Response]
    def attach_instance_iso(instance_id, opts = {})
      data, _status_code, _headers = attach_instance_iso_with_http_info(instance_id, opts)
      data
    end

    # Attach ISO to Instance
    # Attach an ISO to an Instance.
    # @param instance_id [String] 
    # @param [Hash] opts the optional parameters
    # @option opts [AttachInstanceIsoRequest] :attach_instance_iso_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(AttachInstanceIso202Response, Integer, Hash)>] AttachInstanceIso202Response data, response status code and response headers
    def attach_instance_iso_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.attach_instance_iso ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.attach_instance_iso"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/iso/attach'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'attach_instance_iso_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'AttachInstanceIso202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.attach_instance_iso",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#attach_instance_iso\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Attach Private Network to Instance
    # Attach Private Network to an Instance.<br><br>**Deprecated**: use [Attach VPC to Instance](#operation/attach-instance-vpc) instead.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [AttachInstanceNetworkRequest] :attach_instance_network_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [nil]
    def attach_instance_network(instance_id, opts = {})
      attach_instance_network_with_http_info(instance_id, opts)
      nil
    end

    # Attach Private Network to Instance
    # Attach Private Network to an Instance.&lt;br&gt;&lt;br&gt;**Deprecated**: use [Attach VPC to Instance](#operation/attach-instance-vpc) instead.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [AttachInstanceNetworkRequest] :attach_instance_network_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def attach_instance_network_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.attach_instance_network ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.attach_instance_network"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/private-networks/attach'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'attach_instance_network_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.attach_instance_network",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#attach_instance_network\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Attach VPC to Instance
    # Attach a VPC to an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [AttachInstanceVpcRequest] :attach_instance_vpc_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [nil]
    def attach_instance_vpc(instance_id, opts = {})
      attach_instance_vpc_with_http_info(instance_id, opts)
      nil
    end

    # Attach VPC to Instance
    # Attach a VPC to an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [AttachInstanceVpcRequest] :attach_instance_vpc_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def attach_instance_vpc_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.attach_instance_vpc ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.attach_instance_vpc"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/vpcs/attach'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'attach_instance_vpc_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.attach_instance_vpc",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#attach_instance_vpc\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Attach VPC 2.0 Network to Instance
    # Attach a VPC 2.0 Network to an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [AttachInstanceVpc2Request] :attach_instance_vpc2_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [nil]
    def attach_instance_vpc2(instance_id, opts = {})
      attach_instance_vpc2_with_http_info(instance_id, opts)
      nil
    end

    # Attach VPC 2.0 Network to Instance
    # Attach a VPC 2.0 Network to an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [AttachInstanceVpc2Request] :attach_instance_vpc2_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def attach_instance_vpc2_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.attach_instance_vpc2 ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.attach_instance_vpc2"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/vpc2/attach'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'attach_instance_vpc2_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.attach_instance_vpc2",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#attach_instance_vpc2\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create Instance
    # Create a new VPS Instance in a `region` with the desired `plan`. Choose one of the following to deploy the instance:  * `os_id` * `iso_id` * `snapshot_id` * `app_id` * `image_id`  Supply other attributes as desired.
    # @param [Hash] opts the optional parameters
    # @option opts [CreateInstanceRequest] :create_instance_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [CreateInstance202Response]
    def create_instance(opts = {})
      data, _status_code, _headers = create_instance_with_http_info(opts)
      data
    end

    # Create Instance
    # Create a new VPS Instance in a &#x60;region&#x60; with the desired &#x60;plan&#x60;. Choose one of the following to deploy the instance:  * &#x60;os_id&#x60; * &#x60;iso_id&#x60; * &#x60;snapshot_id&#x60; * &#x60;app_id&#x60; * &#x60;image_id&#x60;  Supply other attributes as desired.
    # @param [Hash] opts the optional parameters
    # @option opts [CreateInstanceRequest] :create_instance_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(CreateInstance202Response, Integer, Hash)>] CreateInstance202Response data, response status code and response headers
    def create_instance_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.create_instance ...'
      end
      # resource path
      local_var_path = '/instances'

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'create_instance_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'CreateInstance202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.create_instance",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#create_instance\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Set Instance Backup Schedule
    # Set the backup schedule for an Instance in UTC. The `type` is required.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [CreateInstanceBackupScheduleRequest] :create_instance_backup_schedule_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [nil]
    def create_instance_backup_schedule(instance_id, opts = {})
      create_instance_backup_schedule_with_http_info(instance_id, opts)
      nil
    end

    # Set Instance Backup Schedule
    # Set the backup schedule for an Instance in UTC. The &#x60;type&#x60; is required.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [CreateInstanceBackupScheduleRequest] :create_instance_backup_schedule_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def create_instance_backup_schedule_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.create_instance_backup_schedule ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.create_instance_backup_schedule"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/backup-schedule'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'create_instance_backup_schedule_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.create_instance_backup_schedule",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#create_instance_backup_schedule\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create IPv4
    # Create an IPv4 address for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [CreateInstanceIpv4Request] :create_instance_ipv4_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Object]
    def create_instance_ipv4(instance_id, opts = {})
      data, _status_code, _headers = create_instance_ipv4_with_http_info(instance_id, opts)
      data
    end

    # Create IPv4
    # Create an IPv4 address for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [CreateInstanceIpv4Request] :create_instance_ipv4_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def create_instance_ipv4_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.create_instance_ipv4 ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.create_instance_ipv4"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/ipv4'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'create_instance_ipv4_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.create_instance_ipv4",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#create_instance_ipv4\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create Instance Reverse IPv4
    # Create a reverse IPv4 entry for an Instance. The `ip` and `reverse` attributes are required. 
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [CreateInstanceReverseIpv4Request] :create_instance_reverse_ipv4_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [nil]
    def create_instance_reverse_ipv4(instance_id, opts = {})
      create_instance_reverse_ipv4_with_http_info(instance_id, opts)
      nil
    end

    # Create Instance Reverse IPv4
    # Create a reverse IPv4 entry for an Instance. The &#x60;ip&#x60; and &#x60;reverse&#x60; attributes are required. 
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [CreateInstanceReverseIpv4Request] :create_instance_reverse_ipv4_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def create_instance_reverse_ipv4_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.create_instance_reverse_ipv4 ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.create_instance_reverse_ipv4"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/ipv4/reverse'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'create_instance_reverse_ipv4_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.create_instance_reverse_ipv4",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#create_instance_reverse_ipv4\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create Instance Reverse IPv6
    # Create a reverse IPv6 entry for an Instance. The `ip` and `reverse` attributes are required. IP address must be in full, expanded format.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [CreateInstanceReverseIpv6Request] :create_instance_reverse_ipv6_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [nil]
    def create_instance_reverse_ipv6(instance_id, opts = {})
      create_instance_reverse_ipv6_with_http_info(instance_id, opts)
      nil
    end

    # Create Instance Reverse IPv6
    # Create a reverse IPv6 entry for an Instance. The &#x60;ip&#x60; and &#x60;reverse&#x60; attributes are required. IP address must be in full, expanded format.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [CreateInstanceReverseIpv6Request] :create_instance_reverse_ipv6_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def create_instance_reverse_ipv6_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.create_instance_reverse_ipv6 ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.create_instance_reverse_ipv6"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/ipv6/reverse'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'create_instance_reverse_ipv6_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.create_instance_reverse_ipv6",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#create_instance_reverse_ipv6\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete Instance
    # Delete an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_instance(instance_id, opts = {})
      delete_instance_with_http_info(instance_id, opts)
      nil
    end

    # Delete Instance
    # Delete an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_instance_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.delete_instance ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.delete_instance"
      end
      # resource path
      local_var_path = '/instances/{instance-id}'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
        :operation => :"InstancesApi.delete_instance",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#delete_instance\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete IPv4 Address
    # Delete an IPv4 address from an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param ipv4 [String] The IPv4 address.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_instance_ipv4(instance_id, ipv4, opts = {})
      delete_instance_ipv4_with_http_info(instance_id, ipv4, opts)
      nil
    end

    # Delete IPv4 Address
    # Delete an IPv4 address from an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param ipv4 [String] The IPv4 address.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_instance_ipv4_with_http_info(instance_id, ipv4, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.delete_instance_ipv4 ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.delete_instance_ipv4"
      end
      # verify the required parameter 'ipv4' is set
      if @api_client.config.client_side_validation && ipv4.nil?
        fail ArgumentError, "Missing the required parameter 'ipv4' when calling InstancesApi.delete_instance_ipv4"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/ipv4/{ipv4}'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s)).sub('{' + 'ipv4' + '}', CGI.escape(ipv4.to_s))

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
        :operation => :"InstancesApi.delete_instance_ipv4",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#delete_instance_ipv4\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete Instance Reverse IPv6
    # Delete the reverse IPv6 for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param ipv6 [String] The IPv6 address.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_instance_reverse_ipv6(instance_id, ipv6, opts = {})
      delete_instance_reverse_ipv6_with_http_info(instance_id, ipv6, opts)
      nil
    end

    # Delete Instance Reverse IPv6
    # Delete the reverse IPv6 for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param ipv6 [String] The IPv6 address.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_instance_reverse_ipv6_with_http_info(instance_id, ipv6, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.delete_instance_reverse_ipv6 ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.delete_instance_reverse_ipv6"
      end
      # verify the required parameter 'ipv6' is set
      if @api_client.config.client_side_validation && ipv6.nil?
        fail ArgumentError, "Missing the required parameter 'ipv6' when calling InstancesApi.delete_instance_reverse_ipv6"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/ipv6/reverse/{ipv6}'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s)).sub('{' + 'ipv6' + '}', CGI.escape(ipv6.to_s))

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
        :operation => :"InstancesApi.delete_instance_reverse_ipv6",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#delete_instance_reverse_ipv6\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Detach ISO from instance
    # Detach the ISO from an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [DetachInstanceIso202Response]
    def detach_instance_iso(instance_id, opts = {})
      data, _status_code, _headers = detach_instance_iso_with_http_info(instance_id, opts)
      data
    end

    # Detach ISO from instance
    # Detach the ISO from an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [Array<(DetachInstanceIso202Response, Integer, Hash)>] DetachInstanceIso202Response data, response status code and response headers
    def detach_instance_iso_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.detach_instance_iso ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.detach_instance_iso"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/iso/detach'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      return_type = opts[:debug_return_type] || 'DetachInstanceIso202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.detach_instance_iso",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#detach_instance_iso\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Detach Private Network from Instance.
    # Detach Private Network from an Instance.<br><br>**Deprecated**: use [Detach VPC from Instance](#operation/detach-instance-vpc) instead.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [DetachInstanceNetworkRequest] :detach_instance_network_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [nil]
    def detach_instance_network(instance_id, opts = {})
      detach_instance_network_with_http_info(instance_id, opts)
      nil
    end

    # Detach Private Network from Instance.
    # Detach Private Network from an Instance.&lt;br&gt;&lt;br&gt;**Deprecated**: use [Detach VPC from Instance](#operation/detach-instance-vpc) instead.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [DetachInstanceNetworkRequest] :detach_instance_network_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def detach_instance_network_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.detach_instance_network ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.detach_instance_network"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/private-networks/detach'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'detach_instance_network_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.detach_instance_network",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#detach_instance_network\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Detach VPC from Instance
    # Detach a VPC from an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [DetachInstanceVpcRequest] :detach_instance_vpc_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [nil]
    def detach_instance_vpc(instance_id, opts = {})
      detach_instance_vpc_with_http_info(instance_id, opts)
      nil
    end

    # Detach VPC from Instance
    # Detach a VPC from an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [DetachInstanceVpcRequest] :detach_instance_vpc_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def detach_instance_vpc_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.detach_instance_vpc ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.detach_instance_vpc"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/vpcs/detach'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'detach_instance_vpc_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.detach_instance_vpc",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#detach_instance_vpc\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Detach VPC 2.0 Network from Instance
    # Detach a VPC 2.0 Network from an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [DetachInstanceVpc2Request] :detach_instance_vpc2_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [nil]
    def detach_instance_vpc2(instance_id, opts = {})
      detach_instance_vpc2_with_http_info(instance_id, opts)
      nil
    end

    # Detach VPC 2.0 Network from Instance
    # Detach a VPC 2.0 Network from an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [DetachInstanceVpc2Request] :detach_instance_vpc2_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def detach_instance_vpc2_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.detach_instance_vpc2 ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.detach_instance_vpc2"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/vpc2/detach'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'detach_instance_vpc2_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.detach_instance_vpc2",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#detach_instance_vpc2\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Instance
    # Get information about an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [CreateInstance202Response]
    def get_instance(instance_id, opts = {})
      data, _status_code, _headers = get_instance_with_http_info(instance_id, opts)
      data
    end

    # Get Instance
    # Get information about an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [Array<(CreateInstance202Response, Integer, Hash)>] CreateInstance202Response data, response status code and response headers
    def get_instance_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.get_instance ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.get_instance"
      end
      # resource path
      local_var_path = '/instances/{instance-id}'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      return_type = opts[:debug_return_type] || 'CreateInstance202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.get_instance",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#get_instance\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Instance Backup Schedule
    # Get the backup schedule for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [GetInstanceBackupSchedule200Response]
    def get_instance_backup_schedule(instance_id, opts = {})
      data, _status_code, _headers = get_instance_backup_schedule_with_http_info(instance_id, opts)
      data
    end

    # Get Instance Backup Schedule
    # Get the backup schedule for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetInstanceBackupSchedule200Response, Integer, Hash)>] GetInstanceBackupSchedule200Response data, response status code and response headers
    def get_instance_backup_schedule_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.get_instance_backup_schedule ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.get_instance_backup_schedule"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/backup-schedule'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      return_type = opts[:debug_return_type] || 'GetInstanceBackupSchedule200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.get_instance_backup_schedule",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#get_instance_backup_schedule\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Instance Bandwidth
    # Get bandwidth information about an Instance.<br><br>The `bandwidth` object in a successful response contains objects representing a day in the month. The date is denoted by the nested object keys. Days begin and end in the UTC timezone. The bandwidth utilization data contained within the date object is refreshed periodically. We do not recommend using this endpoint to gather real-time metrics.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :date_range The range of days to include, represented as the number of days relative to the current date. Default 30, Minimum 1 and Max 60.
    # @return [GetBandwidthBaremetal200Response]
    def get_instance_bandwidth(instance_id, opts = {})
      data, _status_code, _headers = get_instance_bandwidth_with_http_info(instance_id, opts)
      data
    end

    # Instance Bandwidth
    # Get bandwidth information about an Instance.&lt;br&gt;&lt;br&gt;The &#x60;bandwidth&#x60; object in a successful response contains objects representing a day in the month. The date is denoted by the nested object keys. Days begin and end in the UTC timezone. The bandwidth utilization data contained within the date object is refreshed periodically. We do not recommend using this endpoint to gather real-time metrics.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :date_range The range of days to include, represented as the number of days relative to the current date. Default 30, Minimum 1 and Max 60.
    # @return [Array<(GetBandwidthBaremetal200Response, Integer, Hash)>] GetBandwidthBaremetal200Response data, response status code and response headers
    def get_instance_bandwidth_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.get_instance_bandwidth ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.get_instance_bandwidth"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/bandwidth'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'date_range'] = opts[:'date_range'] if !opts[:'date_range'].nil?

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
        :operation => :"InstancesApi.get_instance_bandwidth",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#get_instance_bandwidth\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Instance IPv4 Information
    # List the IPv4 information for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [Boolean] :public_network If &#x60;true&#x60;, includes information about the public network adapter (such as MAC address) with the &#x60;main_ip&#x60; entry.
    # @option opts [Integer] :per_page Number of items requested per page. Default is 100 and Max is 500. 
    # @option opts [String] :cursor Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
    # @return [GetIpv4Baremetal200Response]
    def get_instance_ipv4(instance_id, opts = {})
      data, _status_code, _headers = get_instance_ipv4_with_http_info(instance_id, opts)
      data
    end

    # List Instance IPv4 Information
    # List the IPv4 information for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [Boolean] :public_network If &#x60;true&#x60;, includes information about the public network adapter (such as MAC address) with the &#x60;main_ip&#x60; entry.
    # @option opts [Integer] :per_page Number of items requested per page. Default is 100 and Max is 500. 
    # @option opts [String] :cursor Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
    # @return [Array<(GetIpv4Baremetal200Response, Integer, Hash)>] GetIpv4Baremetal200Response data, response status code and response headers
    def get_instance_ipv4_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.get_instance_ipv4 ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.get_instance_ipv4"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/ipv4'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'public_network'] = opts[:'public_network'] if !opts[:'public_network'].nil?
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
      return_type = opts[:debug_return_type] || 'GetIpv4Baremetal200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.get_instance_ipv4",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#get_instance_ipv4\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Instance IPv6 Information
    # Get the IPv6 information for an VPS Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [GetIpv6Baremetal200Response]
    def get_instance_ipv6(instance_id, opts = {})
      data, _status_code, _headers = get_instance_ipv6_with_http_info(instance_id, opts)
      data
    end

    # Get Instance IPv6 Information
    # Get the IPv6 information for an VPS Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetIpv6Baremetal200Response, Integer, Hash)>] GetIpv6Baremetal200Response data, response status code and response headers
    def get_instance_ipv6_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.get_instance_ipv6 ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.get_instance_ipv6"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/ipv6'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
        :operation => :"InstancesApi.get_instance_ipv6",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#get_instance_ipv6\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Instance ISO Status
    # Get the ISO status for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [GetInstanceIsoStatus200Response]
    def get_instance_iso_status(instance_id, opts = {})
      data, _status_code, _headers = get_instance_iso_status_with_http_info(instance_id, opts)
      data
    end

    # Get Instance ISO Status
    # Get the ISO status for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetInstanceIsoStatus200Response, Integer, Hash)>] GetInstanceIsoStatus200Response data, response status code and response headers
    def get_instance_iso_status_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.get_instance_iso_status ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.get_instance_iso_status"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/iso'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      return_type = opts[:debug_return_type] || 'GetInstanceIsoStatus200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.get_instance_iso_status",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#get_instance_iso_status\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Instance neighbors
    # Get a list of other instances in the same location as this Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [GetInstanceNeighbors200Response]
    def get_instance_neighbors(instance_id, opts = {})
      data, _status_code, _headers = get_instance_neighbors_with_http_info(instance_id, opts)
      data
    end

    # Get Instance neighbors
    # Get a list of other instances in the same location as this Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetInstanceNeighbors200Response, Integer, Hash)>] GetInstanceNeighbors200Response data, response status code and response headers
    def get_instance_neighbors_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.get_instance_neighbors ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.get_instance_neighbors"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/neighbors'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      return_type = opts[:debug_return_type] || 'GetInstanceNeighbors200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.get_instance_neighbors",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#get_instance_neighbors\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Available Instance Upgrades
    # Get available upgrades for an Instance
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [String] :type Filter upgrade by type:  - all (applications, os, plans) - applications - os - plans
    # @return [GetInstanceUpgrades200Response]
    def get_instance_upgrades(instance_id, opts = {})
      data, _status_code, _headers = get_instance_upgrades_with_http_info(instance_id, opts)
      data
    end

    # Get Available Instance Upgrades
    # Get available upgrades for an Instance
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [String] :type Filter upgrade by type:  - all (applications, os, plans) - applications - os - plans
    # @return [Array<(GetInstanceUpgrades200Response, Integer, Hash)>] GetInstanceUpgrades200Response data, response status code and response headers
    def get_instance_upgrades_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.get_instance_upgrades ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.get_instance_upgrades"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/upgrades'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      return_type = opts[:debug_return_type] || 'GetInstanceUpgrades200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.get_instance_upgrades",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#get_instance_upgrades\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Instance User Data
    # Get the user-supplied, base64 encoded [user data](https://www.vultr.com/docs/manage-instance-user-data-with-the-vultr-metadata-api/) for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [GetInstanceUserdata200Response]
    def get_instance_userdata(instance_id, opts = {})
      data, _status_code, _headers = get_instance_userdata_with_http_info(instance_id, opts)
      data
    end

    # Get Instance User Data
    # Get the user-supplied, base64 encoded [user data](https://www.vultr.com/docs/manage-instance-user-data-with-the-vultr-metadata-api/) for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetInstanceUserdata200Response, Integer, Hash)>] GetInstanceUserdata200Response data, response status code and response headers
    def get_instance_userdata_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.get_instance_userdata ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.get_instance_userdata"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/user-data'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      return_type = opts[:debug_return_type] || 'GetInstanceUserdata200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.get_instance_userdata",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#get_instance_userdata\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Halt Instance
    # Halt an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def halt_instance(instance_id, opts = {})
      halt_instance_with_http_info(instance_id, opts)
      nil
    end

    # Halt Instance
    # Halt an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def halt_instance_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.halt_instance ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.halt_instance"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/halt'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
        :operation => :"InstancesApi.halt_instance",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#halt_instance\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Halt Instances
    # Halt Instances.
    # @param [Hash] opts the optional parameters
    # @option opts [HaltInstancesRequest] :halt_instances_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [nil]
    def halt_instances(opts = {})
      halt_instances_with_http_info(opts)
      nil
    end

    # Halt Instances
    # Halt Instances.
    # @param [Hash] opts the optional parameters
    # @option opts [HaltInstancesRequest] :halt_instances_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def halt_instances_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.halt_instances ...'
      end
      # resource path
      local_var_path = '/instances/halt'

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'halt_instances_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.halt_instances",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#halt_instances\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Instance IPv6 Reverse
    # List the reverse IPv6 information for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [ListInstanceIpv6Reverse200Response]
    def list_instance_ipv6_reverse(instance_id, opts = {})
      data, _status_code, _headers = list_instance_ipv6_reverse_with_http_info(instance_id, opts)
      data
    end

    # List Instance IPv6 Reverse
    # List the reverse IPv6 information for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [Array<(ListInstanceIpv6Reverse200Response, Integer, Hash)>] ListInstanceIpv6Reverse200Response data, response status code and response headers
    def list_instance_ipv6_reverse_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.list_instance_ipv6_reverse ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.list_instance_ipv6_reverse"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/ipv6/reverse'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      return_type = opts[:debug_return_type] || 'ListInstanceIpv6Reverse200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.list_instance_ipv6_reverse",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#list_instance_ipv6_reverse\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List instance Private Networks
    # **Deprecated**: use [List Instance VPCs](#operation/list-instance-vpcs) instead.<br><br>List the private networks for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :per_page Number of items requested per page. Default is 100 and Max is 500.
    # @option opts [String] :cursor Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
    # @return [ListInstancePrivateNetworks200Response]
    def list_instance_private_networks(instance_id, opts = {})
      data, _status_code, _headers = list_instance_private_networks_with_http_info(instance_id, opts)
      data
    end

    # List instance Private Networks
    # **Deprecated**: use [List Instance VPCs](#operation/list-instance-vpcs) instead.&lt;br&gt;&lt;br&gt;List the private networks for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :per_page Number of items requested per page. Default is 100 and Max is 500.
    # @option opts [String] :cursor Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
    # @return [Array<(ListInstancePrivateNetworks200Response, Integer, Hash)>] ListInstancePrivateNetworks200Response data, response status code and response headers
    def list_instance_private_networks_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.list_instance_private_networks ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.list_instance_private_networks"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/private-networks'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      return_type = opts[:debug_return_type] || 'ListInstancePrivateNetworks200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.list_instance_private_networks",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#list_instance_private_networks\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Instance VPC 2.0 Networks
    # List the VPC 2.0 networks for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :per_page Number of items requested per page. Default is 100 and Max is 500.
    # @option opts [String] :cursor Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
    # @return [ListInstanceVpc2200Response]
    def list_instance_vpc2(instance_id, opts = {})
      data, _status_code, _headers = list_instance_vpc2_with_http_info(instance_id, opts)
      data
    end

    # List Instance VPC 2.0 Networks
    # List the VPC 2.0 networks for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :per_page Number of items requested per page. Default is 100 and Max is 500.
    # @option opts [String] :cursor Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
    # @return [Array<(ListInstanceVpc2200Response, Integer, Hash)>] ListInstanceVpc2200Response data, response status code and response headers
    def list_instance_vpc2_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.list_instance_vpc2 ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.list_instance_vpc2"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/vpc2'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      return_type = opts[:debug_return_type] || 'ListInstanceVpc2200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.list_instance_vpc2",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#list_instance_vpc2\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List instance VPCs
    # List the VPCs for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :per_page Number of items requested per page. Default is 100 and Max is 500.
    # @option opts [String] :cursor Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
    # @return [ListInstanceVpcs200Response]
    def list_instance_vpcs(instance_id, opts = {})
      data, _status_code, _headers = list_instance_vpcs_with_http_info(instance_id, opts)
      data
    end

    # List instance VPCs
    # List the VPCs for an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :per_page Number of items requested per page. Default is 100 and Max is 500.
    # @option opts [String] :cursor Cursor for paging. See [Meta and Pagination](#section/Introduction/Meta-and-Pagination).
    # @return [Array<(ListInstanceVpcs200Response, Integer, Hash)>] ListInstanceVpcs200Response data, response status code and response headers
    def list_instance_vpcs_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.list_instance_vpcs ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.list_instance_vpcs"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/vpcs'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      return_type = opts[:debug_return_type] || 'ListInstanceVpcs200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.list_instance_vpcs",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#list_instance_vpcs\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

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
    def list_instances(opts = {})
      data, _status_code, _headers = list_instances_with_http_info(opts)
      data
    end

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
    # @return [Array<(ListInstances200Response, Integer, Hash)>] ListInstances200Response data, response status code and response headers
    def list_instances_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.list_instances ...'
      end
      # resource path
      local_var_path = '/instances'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'per_page'] = opts[:'per_page'] if !opts[:'per_page'].nil?
      query_params[:'cursor'] = opts[:'cursor'] if !opts[:'cursor'].nil?
      query_params[:'tag'] = opts[:'tag'] if !opts[:'tag'].nil?
      query_params[:'label'] = opts[:'label'] if !opts[:'label'].nil?
      query_params[:'main_ip'] = opts[:'main_ip'] if !opts[:'main_ip'].nil?
      query_params[:'region'] = opts[:'region'] if !opts[:'region'].nil?
      query_params[:'firewall_group_id'] = opts[:'firewall_group_id'] if !opts[:'firewall_group_id'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListInstances200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.list_instances",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#list_instances\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Set Default Reverse DNS Entry
    # Set a reverse DNS entry for an IPv4 address
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [PostInstancesInstanceIdIpv4ReverseDefaultRequest] :post_instances_instance_id_ipv4_reverse_default_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [nil]
    def post_instances_instance_id_ipv4_reverse_default(instance_id, opts = {})
      post_instances_instance_id_ipv4_reverse_default_with_http_info(instance_id, opts)
      nil
    end

    # Set Default Reverse DNS Entry
    # Set a reverse DNS entry for an IPv4 address
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [PostInstancesInstanceIdIpv4ReverseDefaultRequest] :post_instances_instance_id_ipv4_reverse_default_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def post_instances_instance_id_ipv4_reverse_default_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.post_instances_instance_id_ipv4_reverse_default ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.post_instances_instance_id_ipv4_reverse_default"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/ipv4/reverse/default'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'post_instances_instance_id_ipv4_reverse_default_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.post_instances_instance_id_ipv4_reverse_default",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#post_instances_instance_id_ipv4_reverse_default\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Reboot Instance
    # Reboot an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def reboot_instance(instance_id, opts = {})
      reboot_instance_with_http_info(instance_id, opts)
      nil
    end

    # Reboot Instance
    # Reboot an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def reboot_instance_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.reboot_instance ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.reboot_instance"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/reboot'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
        :operation => :"InstancesApi.reboot_instance",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#reboot_instance\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Reboot instances
    # Reboot Instances.
    # @param [Hash] opts the optional parameters
    # @option opts [RebootInstancesRequest] :reboot_instances_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [nil]
    def reboot_instances(opts = {})
      reboot_instances_with_http_info(opts)
      nil
    end

    # Reboot instances
    # Reboot Instances.
    # @param [Hash] opts the optional parameters
    # @option opts [RebootInstancesRequest] :reboot_instances_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def reboot_instances_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.reboot_instances ...'
      end
      # resource path
      local_var_path = '/instances/reboot'

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'reboot_instances_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.reboot_instances",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#reboot_instances\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Reinstall Instance
    # Reinstall an Instance using an optional `hostname`.  **Note:** This action may take a few extra seconds to complete.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [ReinstallInstanceRequest] :reinstall_instance_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [CreateInstance202Response]
    def reinstall_instance(instance_id, opts = {})
      data, _status_code, _headers = reinstall_instance_with_http_info(instance_id, opts)
      data
    end

    # Reinstall Instance
    # Reinstall an Instance using an optional &#x60;hostname&#x60;.  **Note:** This action may take a few extra seconds to complete.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [ReinstallInstanceRequest] :reinstall_instance_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(CreateInstance202Response, Integer, Hash)>] CreateInstance202Response data, response status code and response headers
    def reinstall_instance_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.reinstall_instance ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.reinstall_instance"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/reinstall'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'reinstall_instance_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'CreateInstance202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.reinstall_instance",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#reinstall_instance\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Restore Instance
    # Restore an Instance from either `backup_id` or `snapshot_id`.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [RestoreInstanceRequest] :restore_instance_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [RestoreInstance202Response]
    def restore_instance(instance_id, opts = {})
      data, _status_code, _headers = restore_instance_with_http_info(instance_id, opts)
      data
    end

    # Restore Instance
    # Restore an Instance from either &#x60;backup_id&#x60; or &#x60;snapshot_id&#x60;.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [RestoreInstanceRequest] :restore_instance_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(RestoreInstance202Response, Integer, Hash)>] RestoreInstance202Response data, response status code and response headers
    def restore_instance_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.restore_instance ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.restore_instance"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/restore'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'restore_instance_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'RestoreInstance202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.restore_instance",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#restore_instance\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Start instance
    # Start an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def start_instance(instance_id, opts = {})
      start_instance_with_http_info(instance_id, opts)
      nil
    end

    # Start instance
    # Start an Instance.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def start_instance_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.start_instance ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.start_instance"
      end
      # resource path
      local_var_path = '/instances/{instance-id}/start'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
        :operation => :"InstancesApi.start_instance",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#start_instance\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Start instances
    # Start Instances.
    # @param [Hash] opts the optional parameters
    # @option opts [StartInstancesRequest] :start_instances_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [nil]
    def start_instances(opts = {})
      start_instances_with_http_info(opts)
      nil
    end

    # Start instances
    # Start Instances.
    # @param [Hash] opts the optional parameters
    # @option opts [StartInstancesRequest] :start_instances_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def start_instances_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.start_instances ...'
      end
      # resource path
      local_var_path = '/instances/start'

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'start_instances_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.start_instances",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#start_instances\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Instance
    # Update information for an Instance. All attributes are optional. If not set, the attributes will retain their original values.  **Note:** Changing `os_id`, `app_id` or `image_id` may take a few extra seconds to complete.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateInstanceRequest] :update_instance_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [CreateInstance202Response]
    def update_instance(instance_id, opts = {})
      data, _status_code, _headers = update_instance_with_http_info(instance_id, opts)
      data
    end

    # Update Instance
    # Update information for an Instance. All attributes are optional. If not set, the attributes will retain their original values.  **Note:** Changing &#x60;os_id&#x60;, &#x60;app_id&#x60; or &#x60;image_id&#x60; may take a few extra seconds to complete.
    # @param instance_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateInstanceRequest] :update_instance_request Include a JSON object in the request body with a content type of **application/json**.
    # @return [Array<(CreateInstance202Response, Integer, Hash)>] CreateInstance202Response data, response status code and response headers
    def update_instance_with_http_info(instance_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InstancesApi.update_instance ...'
      end
      # verify the required parameter 'instance_id' is set
      if @api_client.config.client_side_validation && instance_id.nil?
        fail ArgumentError, "Missing the required parameter 'instance_id' when calling InstancesApi.update_instance"
      end
      # resource path
      local_var_path = '/instances/{instance-id}'.sub('{' + 'instance-id' + '}', CGI.escape(instance_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'update_instance_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'CreateInstance202Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"InstancesApi.update_instance",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstancesApi#update_instance\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
