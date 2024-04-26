module containerRegistery 'br/public:avm/res/container-registry/registry:0.1.1' = {
  name: 'simpleClusterContainerRegistry'
  params: {
    name: 'testaksclusterrobert'
    acrAdminUserEnabled: true
    location: 'westeurope'
    acrSku: 'Basic'
    publicNetworkAccess: 'Enabled'
  }
}
