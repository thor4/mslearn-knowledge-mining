#!/bin/bash
# Make the script executable by running the following command in your WSL2 terminal:
# chmod +x update-search.sh
# Run the script:
# ./update-search.sh


# Set values for your Search service
url="https://ai102srch98062498.search.windows.net"
admin_key="4vhVBBcRcvjyE5y2T12NK4c5yUfLKfN5ZDstWOfD3RAzSeAIQLl9"

echo "-----"
echo "Updating the skillset..."
curl -X PUT "$url/skillsets/margies-custom-skillset?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: $admin_key" -d "@update-skillset.json"

echo "-----"
echo "Updating the index..."
curl -X PUT "$url/indexes/margies-custom-index?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: $admin_key" -d "@update-index.json"

# Wait for 3 seconds
sleep 3

echo "-----"
echo "Updating the indexer..."
curl -X PUT "$url/indexers/margies-custom-indexer?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: $admin_key" -d "@update-indexer.json"

echo "-----"
echo "Resetting the indexer"
curl -X POST "$url/indexers/margies-custom-indexer/reset?api-version=2020-06-30" -H "Content-Type: application/json" -H "Content-Length: 0" -H "api-key: $admin_key"

# Wait for 5 seconds
sleep 5

echo "-----"
echo "Rerunning the indexer"
curl -X POST "$url/indexers/margies-custom-indexer/run?api-version=2020-06-30" -H "Content-Type: application/json" -H "Content-Length: 0" -H "api-key: $admin_key"