#!/bin/bash
# Make the script executable by running the following command: chmod +x modify-search.sh
# Run the script using the following command: ./modify-search.sh 

# Set values for your Search service
url="https://01-azure-search-ai2.search.windows.net"
admin_key="GAFanOfPfT8IDI5K6xr2UV215v9E2xDBhZpiABdmjqAzSeDwfXKn"

echo "-----"
echo "Updating the skillset..."
curl -X PUT "$url/skillsets/margies-skillset?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: $admin_key" -d "@skillset.json"

# wait
sleep 2

echo "-----"
echo "Updating the index..."
curl -X PUT "$url/indexes/margies-index?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: $admin_key" -d "@index.json"

# wait
sleep 2

echo "-----"
echo "Updating the indexer..."
curl -X PUT "$url/indexers/margies-indexer?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: $admin_key" -d "@indexer.json"

echo "-----"
echo "Resetting the indexer"
curl -X POST "$url/indexers/margies-indexer/reset?api-version=2020-06-30" -H "Content-Type: application/json" -H "Content-Length: 0" -H "api-key: $admin_key"

# wait
sleep 5

echo "-----"
echo "Rerunning the indexer"
curl -X POST "$url/indexers/margies-indexer/run?api-version=2020-06-30" -H "Content-Type: application/json" -H "Content-Length: 0" -H "api-key: $admin_key"