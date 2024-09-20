# VultrRuby::DetachVpc2NodesRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **nodes** | **Array&lt;String&gt;** | An array of ID strings for [nodes](#operation/list-vpc2-nodes) to detach from the VPC 2.0 network. A limit of 1000 nodes can be processed in a request |  |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::DetachVpc2NodesRequest.new(
  nodes: null
)
```

