=begin
#Vultr API

## Introduction  The Vultr API v2 is a set of HTTP endpoints that adhere to RESTful design principles and CRUD actions with predictable URIs. It uses standard HTTP response codes, authentication, and verbs. The API has consistent and well-formed JSON requests and responses with cursor-based pagination to simplify list handling. Error messages are descriptive and easy to understand. All functions of the Vultr customer portal are accessible via the API, enabling you to script complex unattended scenarios with any tool fluent in HTTP.  ## Requests  Communicate with the API by making an HTTP request at the correct endpoint. The chosen method determines the action taken.  | Method | Usage | | ------ | ------------- | | DELETE | Use the DELETE method to destroy a resource in your account. If it is not found, the operation will return a 4xx error and an appropriate message. | | GET | To retrieve information about a resource, use the GET method. The data is returned as a JSON object. GET methods are read-only and do not affect any resources. | | PATCH | Some resources support partial modification with PATCH, which modifies specific attributes without updating the entire object representation. | | POST | Issue a POST method to create a new object. Include all needed attributes in the request body encoded as JSON. | | PUT | Use the PUT method to update information about a resource. PUT will set new values on the item without regard to their current values. |  **Rate Limit:** Vultr safeguards the API against bursts of incoming traffic based on the request's IP address to ensure stability for all users. If your application sends more than 30 requests per second, the API may return HTTP status code 429.  ## Response Codes  We use standard HTTP response codes to show the success or failure of requests. Response codes in the 2xx range indicate success, while codes in the 4xx range indicate an error, such as an authorization failure or a malformed request. All 4xx errors will return a JSON response object with an `error` attribute explaining the error. Codes in the 5xx range indicate a server-side problem preventing Vultr from fulfilling your request.  | Response | Description | | ------ | ------------- | | 200 OK | The response contains your requested information. | | 201 Created | Your request was accepted. The resource was created. | | 202 Accepted | Your request was accepted. The resource was created or updated. | | 204 No Content | Your request succeeded, there is no additional information returned. | | 400 Bad Request | Your request was malformed. | | 401 Unauthorized | You did not supply valid authentication credentials. | | 403 Forbidden | You are not allowed to perform that action. | | 404 Not Found | No results were found for your request. | | 429 Too Many Requests | Your request exceeded the API rate limit. | | 500 Internal Server Error | We were unable to perform the request due to server-side problems. |  ## Meta and Pagination  Many API calls will return a `meta` object with paging information.  ### Definitions  | Term | Description | | ------ | ------------- | | **List** | The items returned from the database for your request (not necessarily shown in a single response depending on the **cursor** size). | | **Page** | A subset of the full **list** of items. Choose the size of a **page** with the `per_page` parameter. | | **Total** | The `total` attribute indicates the number of items in the full **list**.| | **Cursor** | Use the `cursor` query parameter to select a next or previous **page**. | | **Next** & **Prev** | Use the `next` and `prev` attributes of the `links` meta object as `cursor` values. |  ### How to use Paging  If your result **list** total exceeds the default **cursor** size (the default depends on the route, but is usually 100 records) or the value defined by the `per_page` query param (when present) the response will be returned to you paginated.  ### Paging Example  > These examples have abbreviated attributes and sample values. Your actual `cursor` values will be encoded alphanumeric strings.  To return a **page** with the first two plans in the List:      curl \"https://api.vultr.com/v2/plans?per_page=2\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  The API returns an object similar to this:      {         \"plans\": [             {                 \"id\": \"vc2-1c-2gb\",                 \"vcpu_count\": 1,                 \"ram\": 2048,                 \"locations\": []             },             {                 \"id\": \"vc2-24c-97gb\",                 \"vcpu_count\": 24,                 \"ram\": 98304,                 \"locations\": []             }         ],         \"meta\": {             \"total\": 19,             \"links\": {                 \"next\": \"WxYzExampleNext\",                 \"prev\": \"WxYzExamplePrev\"             }         }     }  The object contains two plans. The `total` attribute indicates that 19 plans are available in the List. To navigate forward in the **list**, use the `next` value (`WxYzExampleNext` in this example) as your `cursor` query parameter.      curl \"https://api.vultr.com/v2/plans?per_page=2&cursor=WxYzExampleNext\" \\       -X GET       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  Likewise, you can use the example `prev` value `WxYzExamplePrev` to navigate backward.  ## Parameters  You can pass information to the API with three different types of parameters.  ### Path parameters  Some API calls require variable parameters as part of the endpoint path. For example, to retrieve information about a user, supply the `user-id` in the endpoint.      curl \"https://api.vultr.com/v2/users/{user-id}\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  ### Query parameters  Some API calls allow filtering with query parameters. For example, the `/v2/plans` endpoint supports a `type` query parameter. Setting `type=vhf` instructs the API only to return High Frequency Compute plans in the list. You'll find more specifics about valid filters in the endpoint documentation below.      curl \"https://api.vultr.com/v2/plans?type=vhf\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  You can also combine filtering with paging. Use the `per_page` parameter to retreive a subset of vhf plans.      curl \"https://api.vultr.com/v2/plans?type=vhf&per_page=2\" \\       -X GET \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\"  ### Request Body  PUT, POST, and PATCH methods may include an object in the request body with a content type of **application/json**. The documentation for each endpoint below has more information about the expected object.  ## API Example Conventions  The examples in this documentation use `curl`, a command-line HTTP client, to demonstrate useage. Linux and macOS computers usually have curl installed by default, and it's [available for download](https://curl.se/download.html) on all popular platforms including Windows.  Each example is split across multiple lines with the `\\` character, which is compatible with a `bash` terminal. A typical example looks like this:      curl \"https://api.vultr.com/v2/domains\" \\       -X POST \\       -H \"Authorization: Bearer ${VULTR_API_KEY}\" \\       -H \"Content-Type: application/json\" \\       --data '{         \"domain\" : \"example.com\",         \"ip\" : \"192.0.2.123\"       }'  * The `-X` parameter sets the request method. For consistency, we show the method on all examples, even though it's not explicitly required for GET methods. * The `-H` lines set required HTTP headers. These examples are formatted to expand the VULTR\\_API\\_KEY environment variable for your convenience. * Examples that require a JSON object in the request body pass the required data via the `--data` parameter.  All values in this guide are examples. Do not rely on the OS or Plan IDs listed in this guide; use the appropriate endpoint to retreive values before creating resources. 

The version of the OpenAPI document: 2.0
Contact: support@vultr.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 7.2.0-SNAPSHOT

=end

require 'cgi'

module VultrRuby
  class ContainerRegistryApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create Container Registry
    # Create a new Container Registry Subscription
    # @param [Hash] opts the optional parameters
    # @option opts [CreateRegistryRequest] :create_registry_request 
    # @return [Registry]
    def create_registry(opts = {})
      data, _status_code, _headers = create_registry_with_http_info(opts)
      data
    end

    # Create Container Registry
    # Create a new Container Registry Subscription
    # @param [Hash] opts the optional parameters
    # @option opts [CreateRegistryRequest] :create_registry_request 
    # @return [Array<(Registry, Integer, Hash)>] Registry data, response status code and response headers
    def create_registry_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ContainerRegistryApi.create_registry ...'
      end
      # resource path
      local_var_path = '/registry'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'create_registry_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'Registry'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ContainerRegistryApi.create_registry",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContainerRegistryApi#create_registry\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create Docker Credentials
    # Create a fresh set of Docker Credentials for this Container Registry Subscription
    # @param registry_id [String] The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :expiry_seconds The seconds until these credentials expire. When set to 0, credentials do not expire. The default value is 0
    # @option opts [Boolean] :read_write Whether these credentials will have only PULL access or PUSH access as well. If true these credentials can PUSH to repos in this registry. If false, these credentials can only PULL. Default is false.
    # @return [RegistryDockerCredentials]
    def create_registry_docker_credentials(registry_id, opts = {})
      data, _status_code, _headers = create_registry_docker_credentials_with_http_info(registry_id, opts)
      data
    end

    # Create Docker Credentials
    # Create a fresh set of Docker Credentials for this Container Registry Subscription
    # @param registry_id [String] The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :expiry_seconds The seconds until these credentials expire. When set to 0, credentials do not expire. The default value is 0
    # @option opts [Boolean] :read_write Whether these credentials will have only PULL access or PUSH access as well. If true these credentials can PUSH to repos in this registry. If false, these credentials can only PULL. Default is false.
    # @return [Array<(RegistryDockerCredentials, Integer, Hash)>] RegistryDockerCredentials data, response status code and response headers
    def create_registry_docker_credentials_with_http_info(registry_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ContainerRegistryApi.create_registry_docker_credentials ...'
      end
      # verify the required parameter 'registry_id' is set
      if @api_client.config.client_side_validation && registry_id.nil?
        fail ArgumentError, "Missing the required parameter 'registry_id' when calling ContainerRegistryApi.create_registry_docker_credentials"
      end
      # resource path
      local_var_path = '/registry/{registry-id}/docker-credentials?expiry_seconds=0&read_write=false'.sub('{' + 'registry-id' + '}', CGI.escape(registry_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'expiry_seconds'] = opts[:'expiry_seconds'] if !opts[:'expiry_seconds'].nil?
      query_params[:'read_write'] = opts[:'read_write'] if !opts[:'read_write'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'RegistryDockerCredentials'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ContainerRegistryApi.create_registry_docker_credentials",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:OPTIONS, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContainerRegistryApi#create_registry_docker_credentials\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create Docker Credentials for Kubernetes
    # Create a fresh set of Docker Credentials for this Container Registry Subscription and return them in a Kubernetes friendly YAML format
    # @param registry_id [String] The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :expiry_seconds The seconds until these credentials expire. When set to 0, credentials do not expire. The default value is 0
    # @option opts [Boolean] :read_write Whether these credentials will have only PULL access or PUSH access as well. If true these credentials can PUSH to repos in this registry. If false, these credentials can only PULL. Default is false.
    # @option opts [Boolean] :base64_encode Whether this YAML will be returned in a base64 encoded string for ease of downloading. If true, the response will be a base64 encoded string. Default is false.
    # @return [RegistryKubernetesDockerCredentials]
    def create_registry_kubernetes_docker_credentials(registry_id, opts = {})
      data, _status_code, _headers = create_registry_kubernetes_docker_credentials_with_http_info(registry_id, opts)
      data
    end

    # Create Docker Credentials for Kubernetes
    # Create a fresh set of Docker Credentials for this Container Registry Subscription and return them in a Kubernetes friendly YAML format
    # @param registry_id [String] The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :expiry_seconds The seconds until these credentials expire. When set to 0, credentials do not expire. The default value is 0
    # @option opts [Boolean] :read_write Whether these credentials will have only PULL access or PUSH access as well. If true these credentials can PUSH to repos in this registry. If false, these credentials can only PULL. Default is false.
    # @option opts [Boolean] :base64_encode Whether this YAML will be returned in a base64 encoded string for ease of downloading. If true, the response will be a base64 encoded string. Default is false.
    # @return [Array<(RegistryKubernetesDockerCredentials, Integer, Hash)>] RegistryKubernetesDockerCredentials data, response status code and response headers
    def create_registry_kubernetes_docker_credentials_with_http_info(registry_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ContainerRegistryApi.create_registry_kubernetes_docker_credentials ...'
      end
      # verify the required parameter 'registry_id' is set
      if @api_client.config.client_side_validation && registry_id.nil?
        fail ArgumentError, "Missing the required parameter 'registry_id' when calling ContainerRegistryApi.create_registry_kubernetes_docker_credentials"
      end
      # resource path
      local_var_path = '/registry/{registry-id}/docker-credentials/kubernetes?expiry_seconds=0&read_write=false&base64_encode=false'.sub('{' + 'registry-id' + '}', CGI.escape(registry_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'expiry_seconds'] = opts[:'expiry_seconds'] if !opts[:'expiry_seconds'].nil?
      query_params[:'read_write'] = opts[:'read_write'] if !opts[:'read_write'].nil?
      query_params[:'base64_encode'] = opts[:'base64_encode'] if !opts[:'base64_encode'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/yaml'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'RegistryKubernetesDockerCredentials'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ContainerRegistryApi.create_registry_kubernetes_docker_credentials",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:OPTIONS, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContainerRegistryApi#create_registry_kubernetes_docker_credentials\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete Container Registry
    # Deletes a Container Registry Subscription
    # @param registry_id [String] The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_registry(registry_id, opts = {})
      delete_registry_with_http_info(registry_id, opts)
      nil
    end

    # Delete Container Registry
    # Deletes a Container Registry Subscription
    # @param registry_id [String] The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_registry_with_http_info(registry_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ContainerRegistryApi.delete_registry ...'
      end
      # verify the required parameter 'registry_id' is set
      if @api_client.config.client_side_validation && registry_id.nil?
        fail ArgumentError, "Missing the required parameter 'registry_id' when calling ContainerRegistryApi.delete_registry"
      end
      # resource path
      local_var_path = '/registry/{registry-id}'.sub('{' + 'registry-id' + '}', CGI.escape(registry_id.to_s))

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
        :operation => :"ContainerRegistryApi.delete_registry",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContainerRegistryApi#delete_registry\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete Repository
    # Deletes a Repository from a Container Registry Subscription
    # @param registry_id [String] The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
    # @param repository_image [String] The [Repository Image](#components/schemas/registry-repository/properties/image). Which can be found by [List Repositories](#operation/list-registry-repositories).
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_repository(registry_id, repository_image, opts = {})
      delete_repository_with_http_info(registry_id, repository_image, opts)
      nil
    end

    # Delete Repository
    # Deletes a Repository from a Container Registry Subscription
    # @param registry_id [String] The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
    # @param repository_image [String] The [Repository Image](#components/schemas/registry-repository/properties/image). Which can be found by [List Repositories](#operation/list-registry-repositories).
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_repository_with_http_info(registry_id, repository_image, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ContainerRegistryApi.delete_repository ...'
      end
      # verify the required parameter 'registry_id' is set
      if @api_client.config.client_side_validation && registry_id.nil?
        fail ArgumentError, "Missing the required parameter 'registry_id' when calling ContainerRegistryApi.delete_repository"
      end
      # verify the required parameter 'repository_image' is set
      if @api_client.config.client_side_validation && repository_image.nil?
        fail ArgumentError, "Missing the required parameter 'repository_image' when calling ContainerRegistryApi.delete_repository"
      end
      # resource path
      local_var_path = '/registry/{registry-id}/repository/{repository-image}'.sub('{' + 'registry-id' + '}', CGI.escape(registry_id.to_s)).sub('{' + 'repository-image' + '}', CGI.escape(repository_image.to_s))

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
        :operation => :"ContainerRegistryApi.delete_repository",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContainerRegistryApi#delete_repository\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Container Registries
    # List All Container Registry Subscriptions for this account
    # @param [Hash] opts the optional parameters
    # @return [ListRegistries200Response]
    def list_registries(opts = {})
      data, _status_code, _headers = list_registries_with_http_info(opts)
      data
    end

    # List Container Registries
    # List All Container Registry Subscriptions for this account
    # @param [Hash] opts the optional parameters
    # @return [Array<(ListRegistries200Response, Integer, Hash)>] ListRegistries200Response data, response status code and response headers
    def list_registries_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ContainerRegistryApi.list_registries ...'
      end
      # resource path
      local_var_path = '/registries'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListRegistries200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ContainerRegistryApi.list_registries",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContainerRegistryApi#list_registries\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Registry Plans
    # List All Plans to help choose which one is the best fit for your Container Registry
    # @param [Hash] opts the optional parameters
    # @return [ListRegistryPlans200Response]
    def list_registry_plans(opts = {})
      data, _status_code, _headers = list_registry_plans_with_http_info(opts)
      data
    end

    # List Registry Plans
    # List All Plans to help choose which one is the best fit for your Container Registry
    # @param [Hash] opts the optional parameters
    # @return [Array<(ListRegistryPlans200Response, Integer, Hash)>] ListRegistryPlans200Response data, response status code and response headers
    def list_registry_plans_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ContainerRegistryApi.list_registry_plans ...'
      end
      # resource path
      local_var_path = '/registry/plan/list'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListRegistryPlans200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ContainerRegistryApi.list_registry_plans",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContainerRegistryApi#list_registry_plans\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Registry Regions
    # List All Regions where a Container Registry can be deployed
    # @param [Hash] opts the optional parameters
    # @return [ListRegistryRegions200Response]
    def list_registry_regions(opts = {})
      data, _status_code, _headers = list_registry_regions_with_http_info(opts)
      data
    end

    # List Registry Regions
    # List All Regions where a Container Registry can be deployed
    # @param [Hash] opts the optional parameters
    # @return [Array<(ListRegistryRegions200Response, Integer, Hash)>] ListRegistryRegions200Response data, response status code and response headers
    def list_registry_regions_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ContainerRegistryApi.list_registry_regions ...'
      end
      # resource path
      local_var_path = '/registry/region/list'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListRegistryRegions200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ContainerRegistryApi.list_registry_regions",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContainerRegistryApi#list_registry_regions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Repositories
    # List All Repositories in a Container Registry Subscription
    # @param registry_id [String] The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
    # @param [Hash] opts the optional parameters
    # @return [ListRegistryRepositories200Response]
    def list_registry_repositories(registry_id, opts = {})
      data, _status_code, _headers = list_registry_repositories_with_http_info(registry_id, opts)
      data
    end

    # List Repositories
    # List All Repositories in a Container Registry Subscription
    # @param registry_id [String] The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
    # @param [Hash] opts the optional parameters
    # @return [Array<(ListRegistryRepositories200Response, Integer, Hash)>] ListRegistryRepositories200Response data, response status code and response headers
    def list_registry_repositories_with_http_info(registry_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ContainerRegistryApi.list_registry_repositories ...'
      end
      # verify the required parameter 'registry_id' is set
      if @api_client.config.client_side_validation && registry_id.nil?
        fail ArgumentError, "Missing the required parameter 'registry_id' when calling ContainerRegistryApi.list_registry_repositories"
      end
      # resource path
      local_var_path = '/registry/{registry-id}/repositories'.sub('{' + 'registry-id' + '}', CGI.escape(registry_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ListRegistryRepositories200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ContainerRegistryApi.list_registry_repositories",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContainerRegistryApi#list_registry_repositories\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Read Container Registry
    # Get a single Container Registry Subscription
    # @param registry_id [String] The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
    # @param [Hash] opts the optional parameters
    # @return [Registry]
    def read_registry(registry_id, opts = {})
      data, _status_code, _headers = read_registry_with_http_info(registry_id, opts)
      data
    end

    # Read Container Registry
    # Get a single Container Registry Subscription
    # @param registry_id [String] The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
    # @param [Hash] opts the optional parameters
    # @return [Array<(Registry, Integer, Hash)>] Registry data, response status code and response headers
    def read_registry_with_http_info(registry_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ContainerRegistryApi.read_registry ...'
      end
      # verify the required parameter 'registry_id' is set
      if @api_client.config.client_side_validation && registry_id.nil?
        fail ArgumentError, "Missing the required parameter 'registry_id' when calling ContainerRegistryApi.read_registry"
      end
      # resource path
      local_var_path = '/registry/{registry-id}'.sub('{' + 'registry-id' + '}', CGI.escape(registry_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Registry'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ContainerRegistryApi.read_registry",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContainerRegistryApi#read_registry\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Read Repository
    # Get a single Repository in a Container Registry Subscription
    # @param registry_id [String] The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
    # @param repository_image [String] The [Repository Image](#components/schemas/registry-repository/properties/image). Which can be found by [List Repositories](#operation/list-registry-repositories).
    # @param [Hash] opts the optional parameters
    # @return [RegistryRepository]
    def read_registry_repository(registry_id, repository_image, opts = {})
      data, _status_code, _headers = read_registry_repository_with_http_info(registry_id, repository_image, opts)
      data
    end

    # Read Repository
    # Get a single Repository in a Container Registry Subscription
    # @param registry_id [String] The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
    # @param repository_image [String] The [Repository Image](#components/schemas/registry-repository/properties/image). Which can be found by [List Repositories](#operation/list-registry-repositories).
    # @param [Hash] opts the optional parameters
    # @return [Array<(RegistryRepository, Integer, Hash)>] RegistryRepository data, response status code and response headers
    def read_registry_repository_with_http_info(registry_id, repository_image, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ContainerRegistryApi.read_registry_repository ...'
      end
      # verify the required parameter 'registry_id' is set
      if @api_client.config.client_side_validation && registry_id.nil?
        fail ArgumentError, "Missing the required parameter 'registry_id' when calling ContainerRegistryApi.read_registry_repository"
      end
      # verify the required parameter 'repository_image' is set
      if @api_client.config.client_side_validation && repository_image.nil?
        fail ArgumentError, "Missing the required parameter 'repository_image' when calling ContainerRegistryApi.read_registry_repository"
      end
      # resource path
      local_var_path = '/registry/{registry-id}/repository/{repository-image}'.sub('{' + 'registry-id' + '}', CGI.escape(registry_id.to_s)).sub('{' + 'repository-image' + '}', CGI.escape(repository_image.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'RegistryRepository'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ContainerRegistryApi.read_registry_repository",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContainerRegistryApi#read_registry_repository\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Container Registry
    # Update a Container Registry Subscription
    # @param registry_id [String] The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateRegistryRequest] :update_registry_request 
    # @return [Registry]
    def update_registry(registry_id, opts = {})
      data, _status_code, _headers = update_registry_with_http_info(registry_id, opts)
      data
    end

    # Update Container Registry
    # Update a Container Registry Subscription
    # @param registry_id [String] The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateRegistryRequest] :update_registry_request 
    # @return [Array<(Registry, Integer, Hash)>] Registry data, response status code and response headers
    def update_registry_with_http_info(registry_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ContainerRegistryApi.update_registry ...'
      end
      # verify the required parameter 'registry_id' is set
      if @api_client.config.client_side_validation && registry_id.nil?
        fail ArgumentError, "Missing the required parameter 'registry_id' when calling ContainerRegistryApi.update_registry"
      end
      # resource path
      local_var_path = '/registry/{registry-id}'.sub('{' + 'registry-id' + '}', CGI.escape(registry_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'update_registry_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'Registry'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ContainerRegistryApi.update_registry",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContainerRegistryApi#update_registry\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Repository
    # Update a Repository in a Container Registry Subscription
    # @param registry_id [String] The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
    # @param repository_image [String] The [Repository Image](#components/schemas/registry-repository/properties/image). Which can be found by [List Repositories](#operation/list-registry-repositories).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateRepositoryRequest] :update_repository_request 
    # @return [RegistryRepository]
    def update_repository(registry_id, repository_image, opts = {})
      data, _status_code, _headers = update_repository_with_http_info(registry_id, repository_image, opts)
      data
    end

    # Update Repository
    # Update a Repository in a Container Registry Subscription
    # @param registry_id [String] The [Registry ID](#components/schemas/registry/properties/id). Which can be found by [List Registries](#operation/list-registries).
    # @param repository_image [String] The [Repository Image](#components/schemas/registry-repository/properties/image). Which can be found by [List Repositories](#operation/list-registry-repositories).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateRepositoryRequest] :update_repository_request 
    # @return [Array<(RegistryRepository, Integer, Hash)>] RegistryRepository data, response status code and response headers
    def update_repository_with_http_info(registry_id, repository_image, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ContainerRegistryApi.update_repository ...'
      end
      # verify the required parameter 'registry_id' is set
      if @api_client.config.client_side_validation && registry_id.nil?
        fail ArgumentError, "Missing the required parameter 'registry_id' when calling ContainerRegistryApi.update_repository"
      end
      # verify the required parameter 'repository_image' is set
      if @api_client.config.client_side_validation && repository_image.nil?
        fail ArgumentError, "Missing the required parameter 'repository_image' when calling ContainerRegistryApi.update_repository"
      end
      # resource path
      local_var_path = '/registry/{registry-id}/repository/{repository-image}'.sub('{' + 'registry-id' + '}', CGI.escape(registry_id.to_s)).sub('{' + 'repository-image' + '}', CGI.escape(repository_image.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'update_repository_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'RegistryRepository'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"ContainerRegistryApi.update_repository",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContainerRegistryApi#update_repository\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
