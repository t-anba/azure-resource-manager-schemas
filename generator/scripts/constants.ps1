## ===========================================================================
# constants
$generatorRoot = resolvepath $PSScriptRoot/..
$tmpRoot = resolvepath $generatorRoot/tmp
New-Item -Type Directory -Force -Path $tmpRoot | Out-Null

$restSpecsRepoPath = resolvepath $tmpRoot/specs
$restSpecsRepoUri = "https://github.com/azure/azure-rest-api-specs"
$restSpecsRepoCommitHash = "master"

$autoRestVerboseOutput = $false

$schemasBaseUri = "https://raw.githubusercontent.com/t-anba/azure-resource-manager-schemas/t-anbaAzSDeploymentTemplate/schemas"
$schemasBasePath = "$generatorRoot/../schemas"
$generatedSchemasUri = "$schemasBaseUri/2019-04-01/autogeneratedResources.json"
$generatedSchemasPath = "$schemasBasePath/2019-04-01/autogeneratedResources.json"
$generatedSchemasTemplatePath = "$generatorRoot/resources/autogeneratedResources_template.json"

# Set of base paths and allowed API versions. Use '*' to specify all API versions.
# See find-specs.ps1 to regenerate this list.
$apiVersionWhitelist  = @{
  'sqlvirtualmachine/resource-manager/Microsoft.SqlVirtualMachine' = @('*');
  'machinelearningcompute/resource-manager/Microsoft.MachineLearningCompute' = @('*');
  'iotspaces/resource-manager/Microsoft.IoTSpaces' = @('*');
  'botservice/resource-manager/Microsoft.BotService' = @('*');
  'databox/resource-manager/Microsoft.DataBox' = @('*');
  'windowsiot/resource-manager/Microsoft.WindowsIoT' = @('*');
  'databricks/resource-manager/Microsoft.Databricks' = @('*');
  'storagesync/resource-manager/Microsoft.StorageSync' = @('*');
  'devspaces/resource-manager/Microsoft.DevSpaces' = @('*');
  'policyinsights/resource-manager/Microsoft.PolicyInsights' = @('*');
  'servicefabricmesh/resource-manager/Microsoft.ServiceFabricMesh' = @('*');
  'labservices/resource-manager/Microsoft.LabServices' = @('*');
  'EnterpriseKnowledgeGraph/resource-manager/Microsoft.EnterpriseKnowledgeGraph' = @('*');
  'edgegateway/resource-manager/Microsoft.DataBoxEdge' = @('*');
  'portal/resource-manager/Microsoft.Portal' = @('*')
};