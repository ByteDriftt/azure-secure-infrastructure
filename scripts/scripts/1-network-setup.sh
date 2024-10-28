#!/bin/bash

# Set variables
RESOURCE_GROUP="myRG"
LOCATION="eastus"
VNET_NAME="myVNet"
VNET_PREFIX="10.0.0.0/16"
FRONTEND_SUBNET_PREFIX="10.0.1.0/24"
BACKEND_SUBNET_PREFIX="10.0.2.0/24"
BASTION_SUBNET_PREFIX="10.0.4.64/26"

# Create Resource Group
echo "Creating Resource Group..."
az group create --name $RESOURCE_GROUP --location $LOCATION

# Create VNet
echo "Creating Virtual Network..."
az network vnet create \
    --resource-group $RESOURCE_GROUP \
    --name $VNET_NAME \
    --address-prefix $VNET_PREFIX

# Create Subnets
echo "Creating Frontend Subnet..."
az network vnet subnet create \
    --resource-group $RESOURCE_GROUP \
    --vnet-name $VNET_NAME \
    --name FrontendSubnet \
    --address-prefix $FRONTEND_SUBNET_PREFIX

echo "Creating Backend Subnet..."
az network vnet subnet create \
    --resource-group $RESOURCE_GROUP \
    --vnet-name $VNET_NAME \
    --name BackendSubnet \
    --address-prefix $BACKEND_SUBNET_PREFIX

echo "Creating Bastion Subnet..."
az network vnet subnet create \
    --resource-group $RESOURCE_GROUP \
    --vnet-name $VNET_NAME \
    --name AzureBastionSubnet \
    --address-prefix $BASTION_SUBNET_PREFIX

echo "Network setup complete!"