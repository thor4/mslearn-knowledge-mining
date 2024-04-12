@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

rem Set values for your storage account
set subscription_id="053b2edd-bc13-453e-9f0f-98145fdfbea6"
set azure_storage_account="01azuresearchstorage"
set azure_storage_key="BX1fUJvCyvsngmLDz62JO6LzQKjWMUpCiwvYa8vfyxaQoJx1l3CXaqjuq9wXYzO2lZnkZlbmXukK+AStJ5VOAw=="


echo Creating container...
call az storage container create --account-name !azure_storage_account! --subscription !subscription_id! --name margies --public-access blob --auth-mode key --account-key !azure_storage_key! --output none

echo Uploading files...
call az storage blob upload-batch -d margies -s data --account-name !azure_storage_account! --auth-mode key --account-key !azure_storage_key!  --output none
