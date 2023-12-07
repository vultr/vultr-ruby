# VultRuby::DetachVpc2NodesRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **nodes** | **Array** | An array of ID strings for [nodes](#operation/list-vpc2-nodes) to detach from the VPC 2.0 network. A limit of 1000 nodes can be processed in a request |  |

## Example

```ruby
require 'vult_ruby'

instance = VultRuby::DetachVpc2NodesRequest.new(
  nodes: null
)
```

