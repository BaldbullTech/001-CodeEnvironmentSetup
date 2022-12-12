# 01 - Code Environment Setup
# Powershell first

# Connect to Azure
Connect-AzAccount

# Get your current context
Get-AzContext

# List subscriptions you have access to
Get-AzSubscription

# Change to a different subscription
Set-AzContext -Subscription "My subscription name"


# REST API

# Authorization header
$header = @{
  Authorization = "Bearer " + (Get-AzAccessToken).Token
}

# Populate subscription and the Resource Group to query
$subscription = (Get-AzContext).Subscription
$rsg = "rg-client"

# Construct the URI
$uri = "https://management.azure.com/subscriptions/$($subscription)/resourceGroups/$($rsg)/providers/Microsoft.Compute/virtualMachines?api-version=2022-08-01"

# Make the call and display the results
$result = Invoke-RestMethod -Method get -uri $uri -Headers $header -ContentType "application/json"
$result
