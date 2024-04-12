#!/bin/bash
# Make the script executable by running the following command: chmod +x UploadDocs.sh
# Run the script using the following command: ./UploadDocs.sh

# Set values for your storage account
subscription_id="053b2edd-bc13-453e-9f0f-98145fdfbea6"
azure_storage_account="01azuresearchstorage"
azure_storage_key="BX1fUJvCyvsngmLDz62JO6LzQKjWMUpCiwvYa8vfyxaQoJx1l3CXaqjuq9wXYzO2lZnkZlbmXukK+AStJ5VOAw=="

echo "Creating container..."
az storage container create --account-name "$azure_storage_account" --subscription "$subscription_id" --name margies --public-access blob --auth-mode key --account-key "$azure_storage_key" --output none

echo "Uploading files..."
az storage blob upload-batch -d margies -s data --account-name "$azure_storage_account" --auth-mode key --account-key "$azure_storage_key" --output none