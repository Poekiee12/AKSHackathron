module k8s 'br/public:avm/res/container-service/managed-cluster:0.1.3' = {
  name: 'k8s-cluster'
  params: {
    name: 'k8s-cluster'
    location: 'westeurope'
    kubernetesVersion: '1.28'
    loadBalancerSku: 'standard'
    skuTier: 'Free'
    primaryAgentPoolProfile: [
      {
        count: 3
        mode: 'System'
        name: 'systempool'
        vmSize: 'Standard_DS2_v2'
      }
    ]
    agentPools: [
      {
        availabilityZones: [
          '3'
        ]
        count: 3
        enableAutoScaling: true
        maxCount: 3
        maxPods: 50
        minCount: 3
        minPods: 2
        mode: 'User'
        name: 'userpool1'
        nodeLabels: {}
        osDiskSizeGB: 60
        osDiskType: 'Ephemeral'
        osType: 'Linux'
        scaleSetEvictionPolicy: 'Delete'
        scaleSetPriority: 'Regular'
        type: 'VirtualMachineScaleSets'
        vmSize: 'Standard_DS2_v2'
      }
    ]
    managedIdentities: {
      systemAssigned: true
    }
    disableLocalAccounts: false
    networkPlugin: 'azure'
    publicNetworkAccess: 'Enabled'
  }
}
