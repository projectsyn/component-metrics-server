local com = import 'lib/commodore.libjsonnet';
local kap = import 'lib/kapitan.libjsonnet';
local inv = kap.inventory();

// The hiera parameters for the component
local params = inv.parameters.metrics_server;

local values = {
  image: {
    repository: '%(registry)s/%(repository)s' % params.images.metrics_server,
    [if std.objectHas(params.images.metrics_server, 'tag') then 'tag']: params.images.metrics_server.tag,
  },
};

{
  'metrics-values': values,
  'metrics-overrides': params.helm_values,
}
