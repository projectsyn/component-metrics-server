// main template for metrics-server
local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();
// The hiera parameters for the component
local params = inv.parameters.metrics_server;

local namespace = kube.Namespace(params.namespace);

// Define outputs below
{
  '00_namespace': namespace,
}
