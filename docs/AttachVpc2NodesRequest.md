# VultrRuby::AttachVpc2NodesRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **nodes** | **Array&lt;String&gt;** | An array of ID strings for [instances](#operation/list-instances) and [Bare Metal servers](#operation/list-baremetals) to attach as nodes to the VPC 2.0 network. A limit of 1000 nodes can be processed in a request |  |

## Example

```ruby
require 'vultr_ruby'

instance = VultrRuby::AttachVpc2NodesRequest.new(
  nodes: null
)
```

