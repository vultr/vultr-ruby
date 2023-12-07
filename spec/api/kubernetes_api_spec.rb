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

# Unit tests for VultRuby::KubernetesApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'KubernetesApi' do
  before do
    # run before each test
    @api_instance = VultRuby::KubernetesApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of KubernetesApi' do
    it 'should create an instance of KubernetesApi' do
      expect(@api_instance).to be_instance_of(VultRuby::KubernetesApi)
    end
  end

  # unit tests for create_kubernetes_cluster
  # Create Kubernetes Cluster
  # Create Kubernetes Cluster
  # @param [Hash] opts the optional parameters
  # @option opts [CreateKubernetesClusterRequest] :create_kubernetes_cluster_request Request Body
  # @return [CreateKubernetesCluster201Response]
  describe 'create_kubernetes_cluster test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for create_nodepools
  # Create NodePool
  # Create NodePool for a Existing Kubernetes Cluster
  # @param vke_id The [VKE ID](#operation/list-kubernetes-clusters).
  # @param [Hash] opts the optional parameters
  # @option opts [CreateNodepoolsRequest] :create_nodepools_request Request Body
  # @return [CreateNodepools201Response]
  describe 'create_nodepools test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for delete_kubernetes_cluster
  # Delete Kubernetes Cluster
  # Delete Kubernetes Cluster
  # @param vke_id The [VKE ID](#operation/list-kubernetes-clusters).
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_kubernetes_cluster test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for delete_kubernetes_cluster_vke_id_delete_with_linked_resources
  # Delete VKE Cluster and All Related Resources
  # Delete Kubernetes Cluster and all related resources. 
  # @param vke_id 
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_kubernetes_cluster_vke_id_delete_with_linked_resources test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for delete_nodepool
  # Delete Nodepool
  # Delete a NodePool from a Kubernetes Cluster
  # @param vke_id The [VKE ID](#operation/list-kubernetes-clusters).
  # @param nodepool_id The [NodePool ID](#operation/get-nodepools).
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_nodepool test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for delete_nodepool_instance
  # Delete NodePool Instance
  # Delete a single nodepool instance from a given Nodepool
  # @param vke_id The [VKE ID](#operation/list-kubernetes-clusters).
  # @param nodepool_id The [NodePool ID](#operation/get-nodepools).
  # @param node_id The [Instance ID](#operation/list-instances).
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_nodepool_instance test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_kubernetes_available_upgrades
  # Get Kubernetes Available Upgrades
  # Get the available upgrades for the specified Kubernetes cluster.
  # @param vke_id The [VKE ID](#operation/list-kubernetes-clusters).
  # @param [Hash] opts the optional parameters
  # @return [GetKubernetesAvailableUpgrades200Response]
  describe 'get_kubernetes_available_upgrades test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_kubernetes_clusters
  # Get Kubernetes Cluster
  # Get Kubernetes Cluster
  # @param vke_id The [VKE ID](#operation/list-kubernetes-clusters).
  # @param [Hash] opts the optional parameters
  # @return [CreateKubernetesCluster201Response]
  describe 'get_kubernetes_clusters test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_kubernetes_clusters_config
  # Get Kubernetes Cluster Kubeconfig
  # Get Kubernetes Cluster Kubeconfig
  # @param vke_id The [VKE ID](#operation/list-kubernetes-clusters).
  # @param [Hash] opts the optional parameters
  # @return [GetKubernetesClustersConfig200Response]
  describe 'get_kubernetes_clusters_config test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_kubernetes_resources
  # Get Kubernetes Resources
  # Get the block storage volumes and load balancers deployed by the specified Kubernetes cluster.
  # @param vke_id The [VKE ID](#operation/list-kubernetes-clusters).
  # @param [Hash] opts the optional parameters
  # @return [GetKubernetesResources200Response]
  describe 'get_kubernetes_resources test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_kubernetes_versions
  # Get Kubernetes Versions
  # Get a list of supported Kubernetes versions
  # @param [Hash] opts the optional parameters
  # @return [GetKubernetesVersions200Response]
  describe 'get_kubernetes_versions test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_nodepool
  # Get NodePool
  # Get Nodepool from a Kubernetes Cluster
  # @param vke_id The [VKE ID](#operation/list-kubernetes-clusters).
  # @param nodepool_id The [NodePool ID](#operation/get-nodepools).
  # @param [Hash] opts the optional parameters
  # @return [CreateNodepools201Response]
  describe 'get_nodepool test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_nodepools
  # List NodePools
  # List all available NodePools on a Kubernetes Cluster
  # @param vke_id The [VKE ID](#operation/list-kubernetes-clusters).
  # @param [Hash] opts the optional parameters
  # @return [GetNodepools200Response]
  describe 'get_nodepools test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for list_kubernetes_clusters
  # List all Kubernetes Clusters
  # List all Kubernetes clusters currently deployed
  # @param [Hash] opts the optional parameters
  # @return [ListKubernetesClusters200Response]
  describe 'list_kubernetes_clusters test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for recycle_nodepool_instance
  # Recycle a NodePool Instance
  # Recycle a specific NodePool Instance
  # @param vke_id The [VKE ID](#operation/list-kubernetes-clusters).
  # @param nodepool_id The [NodePool ID](#operation/get-nodepools).
  # @param node_id Node ID
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'recycle_nodepool_instance test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for start_kubernetes_cluster_upgrade
  # Start Kubernetes Cluster Upgrade
  # Start a Kubernetes cluster upgrade.
  # @param vke_id The [VKE ID](#operation/list-kubernetes-clusters).
  # @param [Hash] opts the optional parameters
  # @option opts [StartKubernetesClusterUpgradeRequest] :start_kubernetes_cluster_upgrade_request Request Body
  # @return [nil]
  describe 'start_kubernetes_cluster_upgrade test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for update_kubernetes_cluster
  # Update Kubernetes Cluster
  # Update Kubernetes Cluster
  # @param vke_id The [VKE ID](#operation/list-kubernetes-clusters).
  # @param [Hash] opts the optional parameters
  # @option opts [UpdateKubernetesClusterRequest] :update_kubernetes_cluster_request Request Body
  # @return [nil]
  describe 'update_kubernetes_cluster test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for update_nodepool
  # Update Nodepool
  # Update a Nodepool on a Kubernetes Cluster
  # @param vke_id The [VKE ID](#operation/list-kubernetes-clusters).
  # @param nodepool_id The [NodePool ID](#operation/get-nodepools).
  # @param [Hash] opts the optional parameters
  # @option opts [UpdateNodepoolRequest] :update_nodepool_request Request Body
  # @return [CreateNodepools201Response]
  describe 'update_nodepool test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

end
