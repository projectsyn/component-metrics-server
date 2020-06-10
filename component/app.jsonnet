local kap = import 'lib/kapitan.libjsonnet';
local inv = kap.inventory();
local params = inv.parameters.metrics_server;
local argocd = import 'lib/argocd.libjsonnet';

local app = argocd.App('metrics-server', params.namespace);

{
  'metrics-server': app,
}
