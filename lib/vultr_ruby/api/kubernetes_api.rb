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
  class KubernetesApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create Kubernetes Cluster
    # Create Kubernetes Cluster
    # @param [Hash] opts the optional parameters
    # @option opts [CreateKubernetesClusterRequest] :create_kubernetes_cluster_request Request Body
    # @return [CreateKubernetesCluster201Response]
    def create_kubernetes_cluster(opts = {})
      data, _status_code, _headers = create_kubernetes_cluster_with_http_info(opts)
      data
    end

    # Create Kubernetes Cluster
    # Create Kubernetes Cluster
    # @param [Hash] opts the optional parameters
    # @option opts [CreateKubernetesClusterRequest] :create_kubernetes_cluster_request Request Body
    # @return [Array<(CreateKubernetesCluster201Response, Integer, Hash)>] CreateKubernetesCluster201Response data, response status code and response headers
    def create_kubernetes_cluster_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KubernetesApi.create_kubernetes_cluster ...'
      end
      # resource path
      local_var_path = '/kubernetes/clusters'

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'create_kubernetes_cluster_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'CreateKubernetesCluster201Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"KubernetesApi.create_kubernetes_cluster",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KubernetesApi#create_kubernetes_cluster\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create NodePool
    # Create NodePool for a Existing Kubernetes Cluster
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param [Hash] opts the optional parameters
    # @option opts [CreateNodepoolsRequest] :create_nodepools_request Request Body
    # @return [CreateNodepools201Response]
    def create_nodepools(vke_id, opts = {})
      data, _status_code, _headers = create_nodepools_with_http_info(vke_id, opts)
      data
    end

    # Create NodePool
    # Create NodePool for a Existing Kubernetes Cluster
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param [Hash] opts the optional parameters
    # @option opts [CreateNodepoolsRequest] :create_nodepools_request Request Body
    # @return [Array<(CreateNodepools201Response, Integer, Hash)>] CreateNodepools201Response data, response status code and response headers
    def create_nodepools_with_http_info(vke_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KubernetesApi.create_nodepools ...'
      end
      # verify the required parameter 'vke_id' is set
      if @api_client.config.client_side_validation && vke_id.nil?
        fail ArgumentError, "Missing the required parameter 'vke_id' when calling KubernetesApi.create_nodepools"
      end
      # resource path
      local_var_path = '/kubernetes/clusters/{vke-id}/node-pools'.sub('{' + 'vke-id' + '}', CGI.escape(vke_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'create_nodepools_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'CreateNodepools201Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"KubernetesApi.create_nodepools",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KubernetesApi#create_nodepools\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete Kubernetes Cluster
    # Delete Kubernetes Cluster
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_kubernetes_cluster(vke_id, opts = {})
      delete_kubernetes_cluster_with_http_info(vke_id, opts)
      nil
    end

    # Delete Kubernetes Cluster
    # Delete Kubernetes Cluster
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_kubernetes_cluster_with_http_info(vke_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KubernetesApi.delete_kubernetes_cluster ...'
      end
      # verify the required parameter 'vke_id' is set
      if @api_client.config.client_side_validation && vke_id.nil?
        fail ArgumentError, "Missing the required parameter 'vke_id' when calling KubernetesApi.delete_kubernetes_cluster"
      end
      # resource path
      local_var_path = '/kubernetes/clusters/{vke-id}'.sub('{' + 'vke-id' + '}', CGI.escape(vke_id.to_s))

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
        :operation => :"KubernetesApi.delete_kubernetes_cluster",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KubernetesApi#delete_kubernetes_cluster\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete VKE Cluster and All Related Resources
    # Delete Kubernetes Cluster and all related resources. 
    # @param vke_id [String] 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_kubernetes_cluster_vke_id_delete_with_linked_resources(vke_id, opts = {})
      delete_kubernetes_cluster_vke_id_delete_with_linked_resources_with_http_info(vke_id, opts)
      nil
    end

    # Delete VKE Cluster and All Related Resources
    # Delete Kubernetes Cluster and all related resources. 
    # @param vke_id [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_kubernetes_cluster_vke_id_delete_with_linked_resources_with_http_info(vke_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KubernetesApi.delete_kubernetes_cluster_vke_id_delete_with_linked_resources ...'
      end
      # verify the required parameter 'vke_id' is set
      if @api_client.config.client_side_validation && vke_id.nil?
        fail ArgumentError, "Missing the required parameter 'vke_id' when calling KubernetesApi.delete_kubernetes_cluster_vke_id_delete_with_linked_resources"
      end
      # resource path
      local_var_path = '/kubernetes/clusters/{vke-id}/delete-with-linked-resources'.sub('{' + 'vke-id' + '}', CGI.escape(vke_id.to_s))

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
        :operation => :"KubernetesApi.delete_kubernetes_cluster_vke_id_delete_with_linked_resources",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KubernetesApi#delete_kubernetes_cluster_vke_id_delete_with_linked_resources\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete Nodepool
    # Delete a NodePool from a Kubernetes Cluster
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param nodepool_id [String] The [NodePool ID](#operation/get-nodepools).
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_nodepool(vke_id, nodepool_id, opts = {})
      delete_nodepool_with_http_info(vke_id, nodepool_id, opts)
      nil
    end

    # Delete Nodepool
    # Delete a NodePool from a Kubernetes Cluster
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param nodepool_id [String] The [NodePool ID](#operation/get-nodepools).
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_nodepool_with_http_info(vke_id, nodepool_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KubernetesApi.delete_nodepool ...'
      end
      # verify the required parameter 'vke_id' is set
      if @api_client.config.client_side_validation && vke_id.nil?
        fail ArgumentError, "Missing the required parameter 'vke_id' when calling KubernetesApi.delete_nodepool"
      end
      # verify the required parameter 'nodepool_id' is set
      if @api_client.config.client_side_validation && nodepool_id.nil?
        fail ArgumentError, "Missing the required parameter 'nodepool_id' when calling KubernetesApi.delete_nodepool"
      end
      # resource path
      local_var_path = '/kubernetes/clusters/{vke-id}/node-pools/{nodepool-id}'.sub('{' + 'vke-id' + '}', CGI.escape(vke_id.to_s)).sub('{' + 'nodepool-id' + '}', CGI.escape(nodepool_id.to_s))

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
        :operation => :"KubernetesApi.delete_nodepool",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KubernetesApi#delete_nodepool\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete NodePool Instance
    # Delete a single nodepool instance from a given Nodepool
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param nodepool_id [String] The [NodePool ID](#operation/get-nodepools).
    # @param node_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_nodepool_instance(vke_id, nodepool_id, node_id, opts = {})
      delete_nodepool_instance_with_http_info(vke_id, nodepool_id, node_id, opts)
      nil
    end

    # Delete NodePool Instance
    # Delete a single nodepool instance from a given Nodepool
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param nodepool_id [String] The [NodePool ID](#operation/get-nodepools).
    # @param node_id [String] The [Instance ID](#operation/list-instances).
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def delete_nodepool_instance_with_http_info(vke_id, nodepool_id, node_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KubernetesApi.delete_nodepool_instance ...'
      end
      # verify the required parameter 'vke_id' is set
      if @api_client.config.client_side_validation && vke_id.nil?
        fail ArgumentError, "Missing the required parameter 'vke_id' when calling KubernetesApi.delete_nodepool_instance"
      end
      # verify the required parameter 'nodepool_id' is set
      if @api_client.config.client_side_validation && nodepool_id.nil?
        fail ArgumentError, "Missing the required parameter 'nodepool_id' when calling KubernetesApi.delete_nodepool_instance"
      end
      # verify the required parameter 'node_id' is set
      if @api_client.config.client_side_validation && node_id.nil?
        fail ArgumentError, "Missing the required parameter 'node_id' when calling KubernetesApi.delete_nodepool_instance"
      end
      # resource path
      local_var_path = '/kubernetes/clusters/{vke-id}/node-pools/{nodepool-id}/nodes/{node-id}'.sub('{' + 'vke-id' + '}', CGI.escape(vke_id.to_s)).sub('{' + 'nodepool-id' + '}', CGI.escape(nodepool_id.to_s)).sub('{' + 'node-id' + '}', CGI.escape(node_id.to_s))

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
        :operation => :"KubernetesApi.delete_nodepool_instance",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KubernetesApi#delete_nodepool_instance\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Kubernetes Available Upgrades
    # Get the available upgrades for the specified Kubernetes cluster.
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param [Hash] opts the optional parameters
    # @return [GetKubernetesAvailableUpgrades200Response]
    def get_kubernetes_available_upgrades(vke_id, opts = {})
      data, _status_code, _headers = get_kubernetes_available_upgrades_with_http_info(vke_id, opts)
      data
    end

    # Get Kubernetes Available Upgrades
    # Get the available upgrades for the specified Kubernetes cluster.
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetKubernetesAvailableUpgrades200Response, Integer, Hash)>] GetKubernetesAvailableUpgrades200Response data, response status code and response headers
    def get_kubernetes_available_upgrades_with_http_info(vke_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KubernetesApi.get_kubernetes_available_upgrades ...'
      end
      # verify the required parameter 'vke_id' is set
      if @api_client.config.client_side_validation && vke_id.nil?
        fail ArgumentError, "Missing the required parameter 'vke_id' when calling KubernetesApi.get_kubernetes_available_upgrades"
      end
      # resource path
      local_var_path = '/kubernetes/clusters/{vke-id}/available-upgrades'.sub('{' + 'vke-id' + '}', CGI.escape(vke_id.to_s))

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
      return_type = opts[:debug_return_type] || 'GetKubernetesAvailableUpgrades200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"KubernetesApi.get_kubernetes_available_upgrades",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KubernetesApi#get_kubernetes_available_upgrades\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Kubernetes Cluster
    # Get Kubernetes Cluster
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param [Hash] opts the optional parameters
    # @return [CreateKubernetesCluster201Response]
    def get_kubernetes_clusters(vke_id, opts = {})
      data, _status_code, _headers = get_kubernetes_clusters_with_http_info(vke_id, opts)
      data
    end

    # Get Kubernetes Cluster
    # Get Kubernetes Cluster
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param [Hash] opts the optional parameters
    # @return [Array<(CreateKubernetesCluster201Response, Integer, Hash)>] CreateKubernetesCluster201Response data, response status code and response headers
    def get_kubernetes_clusters_with_http_info(vke_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KubernetesApi.get_kubernetes_clusters ...'
      end
      # verify the required parameter 'vke_id' is set
      if @api_client.config.client_side_validation && vke_id.nil?
        fail ArgumentError, "Missing the required parameter 'vke_id' when calling KubernetesApi.get_kubernetes_clusters"
      end
      # resource path
      local_var_path = '/kubernetes/clusters/{vke-id}'.sub('{' + 'vke-id' + '}', CGI.escape(vke_id.to_s))

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
      return_type = opts[:debug_return_type] || 'CreateKubernetesCluster201Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"KubernetesApi.get_kubernetes_clusters",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KubernetesApi#get_kubernetes_clusters\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Kubernetes Cluster Kubeconfig
    # Get Kubernetes Cluster Kubeconfig
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param [Hash] opts the optional parameters
    # @return [GetKubernetesClustersConfig200Response]
    def get_kubernetes_clusters_config(vke_id, opts = {})
      data, _status_code, _headers = get_kubernetes_clusters_config_with_http_info(vke_id, opts)
      data
    end

    # Get Kubernetes Cluster Kubeconfig
    # Get Kubernetes Cluster Kubeconfig
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetKubernetesClustersConfig200Response, Integer, Hash)>] GetKubernetesClustersConfig200Response data, response status code and response headers
    def get_kubernetes_clusters_config_with_http_info(vke_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KubernetesApi.get_kubernetes_clusters_config ...'
      end
      # verify the required parameter 'vke_id' is set
      if @api_client.config.client_side_validation && vke_id.nil?
        fail ArgumentError, "Missing the required parameter 'vke_id' when calling KubernetesApi.get_kubernetes_clusters_config"
      end
      # resource path
      local_var_path = '/kubernetes/clusters/{vke-id}/config'.sub('{' + 'vke-id' + '}', CGI.escape(vke_id.to_s))

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
      return_type = opts[:debug_return_type] || 'GetKubernetesClustersConfig200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"KubernetesApi.get_kubernetes_clusters_config",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KubernetesApi#get_kubernetes_clusters_config\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Kubernetes Resources
    # Get the block storage volumes and load balancers deployed by the specified Kubernetes cluster.
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param [Hash] opts the optional parameters
    # @return [GetKubernetesResources200Response]
    def get_kubernetes_resources(vke_id, opts = {})
      data, _status_code, _headers = get_kubernetes_resources_with_http_info(vke_id, opts)
      data
    end

    # Get Kubernetes Resources
    # Get the block storage volumes and load balancers deployed by the specified Kubernetes cluster.
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetKubernetesResources200Response, Integer, Hash)>] GetKubernetesResources200Response data, response status code and response headers
    def get_kubernetes_resources_with_http_info(vke_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KubernetesApi.get_kubernetes_resources ...'
      end
      # verify the required parameter 'vke_id' is set
      if @api_client.config.client_side_validation && vke_id.nil?
        fail ArgumentError, "Missing the required parameter 'vke_id' when calling KubernetesApi.get_kubernetes_resources"
      end
      # resource path
      local_var_path = '/kubernetes/clusters/{vke-id}/resources'.sub('{' + 'vke-id' + '}', CGI.escape(vke_id.to_s))

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
      return_type = opts[:debug_return_type] || 'GetKubernetesResources200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"KubernetesApi.get_kubernetes_resources",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KubernetesApi#get_kubernetes_resources\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Kubernetes Versions
    # Get a list of supported Kubernetes versions
    # @param [Hash] opts the optional parameters
    # @return [GetKubernetesVersions200Response]
    def get_kubernetes_versions(opts = {})
      data, _status_code, _headers = get_kubernetes_versions_with_http_info(opts)
      data
    end

    # Get Kubernetes Versions
    # Get a list of supported Kubernetes versions
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetKubernetesVersions200Response, Integer, Hash)>] GetKubernetesVersions200Response data, response status code and response headers
    def get_kubernetes_versions_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KubernetesApi.get_kubernetes_versions ...'
      end
      # resource path
      local_var_path = '/kubernetes/versions'

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
      return_type = opts[:debug_return_type] || 'GetKubernetesVersions200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"KubernetesApi.get_kubernetes_versions",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KubernetesApi#get_kubernetes_versions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get NodePool
    # Get Nodepool from a Kubernetes Cluster
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param nodepool_id [String] The [NodePool ID](#operation/get-nodepools).
    # @param [Hash] opts the optional parameters
    # @return [CreateNodepools201Response]
    def get_nodepool(vke_id, nodepool_id, opts = {})
      data, _status_code, _headers = get_nodepool_with_http_info(vke_id, nodepool_id, opts)
      data
    end

    # Get NodePool
    # Get Nodepool from a Kubernetes Cluster
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param nodepool_id [String] The [NodePool ID](#operation/get-nodepools).
    # @param [Hash] opts the optional parameters
    # @return [Array<(CreateNodepools201Response, Integer, Hash)>] CreateNodepools201Response data, response status code and response headers
    def get_nodepool_with_http_info(vke_id, nodepool_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KubernetesApi.get_nodepool ...'
      end
      # verify the required parameter 'vke_id' is set
      if @api_client.config.client_side_validation && vke_id.nil?
        fail ArgumentError, "Missing the required parameter 'vke_id' when calling KubernetesApi.get_nodepool"
      end
      # verify the required parameter 'nodepool_id' is set
      if @api_client.config.client_side_validation && nodepool_id.nil?
        fail ArgumentError, "Missing the required parameter 'nodepool_id' when calling KubernetesApi.get_nodepool"
      end
      # resource path
      local_var_path = '/kubernetes/clusters/{vke-id}/node-pools/{nodepool-id}'.sub('{' + 'vke-id' + '}', CGI.escape(vke_id.to_s)).sub('{' + 'nodepool-id' + '}', CGI.escape(nodepool_id.to_s))

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
      return_type = opts[:debug_return_type] || 'CreateNodepools201Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"KubernetesApi.get_nodepool",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KubernetesApi#get_nodepool\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List NodePools
    # List all available NodePools on a Kubernetes Cluster
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param [Hash] opts the optional parameters
    # @return [GetNodepools200Response]
    def get_nodepools(vke_id, opts = {})
      data, _status_code, _headers = get_nodepools_with_http_info(vke_id, opts)
      data
    end

    # List NodePools
    # List all available NodePools on a Kubernetes Cluster
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetNodepools200Response, Integer, Hash)>] GetNodepools200Response data, response status code and response headers
    def get_nodepools_with_http_info(vke_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KubernetesApi.get_nodepools ...'
      end
      # verify the required parameter 'vke_id' is set
      if @api_client.config.client_side_validation && vke_id.nil?
        fail ArgumentError, "Missing the required parameter 'vke_id' when calling KubernetesApi.get_nodepools"
      end
      # resource path
      local_var_path = '/kubernetes/clusters/{vke-id}/node-pools'.sub('{' + 'vke-id' + '}', CGI.escape(vke_id.to_s))

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
      return_type = opts[:debug_return_type] || 'GetNodepools200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"KubernetesApi.get_nodepools",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KubernetesApi#get_nodepools\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List all Kubernetes Clusters
    # List all Kubernetes clusters currently deployed
    # @param [Hash] opts the optional parameters
    # @return [ListKubernetesClusters200Response]
    def list_kubernetes_clusters(opts = {})
      data, _status_code, _headers = list_kubernetes_clusters_with_http_info(opts)
      data
    end

    # List all Kubernetes Clusters
    # List all Kubernetes clusters currently deployed
    # @param [Hash] opts the optional parameters
    # @return [Array<(ListKubernetesClusters200Response, Integer, Hash)>] ListKubernetesClusters200Response data, response status code and response headers
    def list_kubernetes_clusters_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KubernetesApi.list_kubernetes_clusters ...'
      end
      # resource path
      local_var_path = '/kubernetes/clusters'

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
      return_type = opts[:debug_return_type] || 'ListKubernetesClusters200Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"KubernetesApi.list_kubernetes_clusters",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KubernetesApi#list_kubernetes_clusters\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Recycle a NodePool Instance
    # Recycle a specific NodePool Instance
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param nodepool_id [String] The [NodePool ID](#operation/get-nodepools).
    # @param node_id [String] Node ID
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def recycle_nodepool_instance(vke_id, nodepool_id, node_id, opts = {})
      recycle_nodepool_instance_with_http_info(vke_id, nodepool_id, node_id, opts)
      nil
    end

    # Recycle a NodePool Instance
    # Recycle a specific NodePool Instance
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param nodepool_id [String] The [NodePool ID](#operation/get-nodepools).
    # @param node_id [String] Node ID
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def recycle_nodepool_instance_with_http_info(vke_id, nodepool_id, node_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KubernetesApi.recycle_nodepool_instance ...'
      end
      # verify the required parameter 'vke_id' is set
      if @api_client.config.client_side_validation && vke_id.nil?
        fail ArgumentError, "Missing the required parameter 'vke_id' when calling KubernetesApi.recycle_nodepool_instance"
      end
      # verify the required parameter 'nodepool_id' is set
      if @api_client.config.client_side_validation && nodepool_id.nil?
        fail ArgumentError, "Missing the required parameter 'nodepool_id' when calling KubernetesApi.recycle_nodepool_instance"
      end
      # verify the required parameter 'node_id' is set
      if @api_client.config.client_side_validation && node_id.nil?
        fail ArgumentError, "Missing the required parameter 'node_id' when calling KubernetesApi.recycle_nodepool_instance"
      end
      # resource path
      local_var_path = '/kubernetes/clusters/{vke-id}/node-pools/{nodepool-id}/nodes/{node-id}/recycle'.sub('{' + 'vke-id' + '}', CGI.escape(vke_id.to_s)).sub('{' + 'nodepool-id' + '}', CGI.escape(nodepool_id.to_s)).sub('{' + 'node-id' + '}', CGI.escape(node_id.to_s))

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
        :operation => :"KubernetesApi.recycle_nodepool_instance",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KubernetesApi#recycle_nodepool_instance\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Start Kubernetes Cluster Upgrade
    # Start a Kubernetes cluster upgrade.
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param [Hash] opts the optional parameters
    # @option opts [StartKubernetesClusterUpgradeRequest] :start_kubernetes_cluster_upgrade_request Request Body
    # @return [nil]
    def start_kubernetes_cluster_upgrade(vke_id, opts = {})
      start_kubernetes_cluster_upgrade_with_http_info(vke_id, opts)
      nil
    end

    # Start Kubernetes Cluster Upgrade
    # Start a Kubernetes cluster upgrade.
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param [Hash] opts the optional parameters
    # @option opts [StartKubernetesClusterUpgradeRequest] :start_kubernetes_cluster_upgrade_request Request Body
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def start_kubernetes_cluster_upgrade_with_http_info(vke_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KubernetesApi.start_kubernetes_cluster_upgrade ...'
      end
      # verify the required parameter 'vke_id' is set
      if @api_client.config.client_side_validation && vke_id.nil?
        fail ArgumentError, "Missing the required parameter 'vke_id' when calling KubernetesApi.start_kubernetes_cluster_upgrade"
      end
      # resource path
      local_var_path = '/kubernetes/clusters/{vke-id}/upgrades'.sub('{' + 'vke-id' + '}', CGI.escape(vke_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'start_kubernetes_cluster_upgrade_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"KubernetesApi.start_kubernetes_cluster_upgrade",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KubernetesApi#start_kubernetes_cluster_upgrade\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Kubernetes Cluster
    # Update Kubernetes Cluster
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateKubernetesClusterRequest] :update_kubernetes_cluster_request Request Body
    # @return [nil]
    def update_kubernetes_cluster(vke_id, opts = {})
      update_kubernetes_cluster_with_http_info(vke_id, opts)
      nil
    end

    # Update Kubernetes Cluster
    # Update Kubernetes Cluster
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateKubernetesClusterRequest] :update_kubernetes_cluster_request Request Body
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def update_kubernetes_cluster_with_http_info(vke_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KubernetesApi.update_kubernetes_cluster ...'
      end
      # verify the required parameter 'vke_id' is set
      if @api_client.config.client_side_validation && vke_id.nil?
        fail ArgumentError, "Missing the required parameter 'vke_id' when calling KubernetesApi.update_kubernetes_cluster"
      end
      # resource path
      local_var_path = '/kubernetes/clusters/{vke-id}'.sub('{' + 'vke-id' + '}', CGI.escape(vke_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'update_kubernetes_cluster_request'])

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"KubernetesApi.update_kubernetes_cluster",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KubernetesApi#update_kubernetes_cluster\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Nodepool
    # Update a Nodepool on a Kubernetes Cluster
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param nodepool_id [String] The [NodePool ID](#operation/get-nodepools).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateNodepoolRequest] :update_nodepool_request Request Body
    # @return [CreateNodepools201Response]
    def update_nodepool(vke_id, nodepool_id, opts = {})
      data, _status_code, _headers = update_nodepool_with_http_info(vke_id, nodepool_id, opts)
      data
    end

    # Update Nodepool
    # Update a Nodepool on a Kubernetes Cluster
    # @param vke_id [String] The [VKE ID](#operation/list-kubernetes-clusters).
    # @param nodepool_id [String] The [NodePool ID](#operation/get-nodepools).
    # @param [Hash] opts the optional parameters
    # @option opts [UpdateNodepoolRequest] :update_nodepool_request Request Body
    # @return [Array<(CreateNodepools201Response, Integer, Hash)>] CreateNodepools201Response data, response status code and response headers
    def update_nodepool_with_http_info(vke_id, nodepool_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: KubernetesApi.update_nodepool ...'
      end
      # verify the required parameter 'vke_id' is set
      if @api_client.config.client_side_validation && vke_id.nil?
        fail ArgumentError, "Missing the required parameter 'vke_id' when calling KubernetesApi.update_nodepool"
      end
      # verify the required parameter 'nodepool_id' is set
      if @api_client.config.client_side_validation && nodepool_id.nil?
        fail ArgumentError, "Missing the required parameter 'nodepool_id' when calling KubernetesApi.update_nodepool"
      end
      # resource path
      local_var_path = '/kubernetes/clusters/{vke-id}/node-pools/{nodepool-id}'.sub('{' + 'vke-id' + '}', CGI.escape(vke_id.to_s)).sub('{' + 'nodepool-id' + '}', CGI.escape(nodepool_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json', 'application/xml'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'update_nodepool_request'])

      # return_type
      return_type = opts[:debug_return_type] || 'CreateNodepools201Response'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['API Key']

      new_options = opts.merge(
        :operation => :"KubernetesApi.update_nodepool",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: KubernetesApi#update_nodepool\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
