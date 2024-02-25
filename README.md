# Provision AKS Cluster using Terraform via Service Principal
## Overview
This Terraform project facilitates the creation of an Azure Kubernetes Service (AKS) cluster in the recommended manner by utilizing a Service Principal. The configuration defines the deployment of various resources to support the AKS cluster, enhancing security and isolating network resources.
## Resources Created
1. **Resource Group**
2. **Service Principal**
3. **AKS Cluster** using the Service Principal
4. **Azure Key Vault** to store the client secret and other sensitive information.
5. **Secret Upload** to Key Vault
6. **Virtual Network** to securely host the AKS cluster and its resources, ensuring isolation from other network resources.
7. **Azure Container Registry** for secure and private container image management.
## Prerequisites
Ensure the following prerequisites are met before using this Terraform configuration:
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) CLI installed
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and logged in
- Storage Account and Blob Container created for storing the tfstate file as backend (Refer to the provided shell script).
### Shell Script for Storage Account Setup
```bash
#!/bin/bash

RESOURCE_GROUP_NAME=dev-rg
STORAGE_ACCOUNT_NAME=tfstatebackend12
CONTAINER_NAME=tfstate

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location southcentralus

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME

## Usage/Examples
1. **Login to the Azure CLI**

   az login --use-device-code
2. **Set Terraform Alias**

   alias tf=terraform
3. **initialize the providers**

  tf init
4. **Run the plan**

  tf plan
5. **Apply the changes**

  tf apply --auto-approve