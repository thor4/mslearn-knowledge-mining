#!/bin/bash
# Make the script executable by running the following command in your WSL2 terminal:
# chmod +x create-search.sh
# Run the script:
# ./create-search.sh

# Set values for your Search service
url="https://ai102srch98062498.search.windows.net"
admin_key="4vhVBBcRcvjyE5y2T12NK4c5yUfLKfN5ZDstWOfD3RAzSeAIQLl9"

echo "-----"
echo "Creating the data source..."
curl -X POST "$url/datasources?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: $admin_key" -d "@data_source.json"

echo "-----"
echo "Creating the skillset..."
curl -X PUT "$url/skillsets/margies-custom-skillset?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: $admin_key" -d "@skillset.json"

echo "-----"
echo "Creating the index..."
curl -X PUT "$url/indexes/margies-custom-index?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: $admin_key" -d "@index.json"

# Wait for 3 seconds
sleep 3

echo "-----"
echo "Creating the indexer..."
curl -X PUT "$url/indexers/margies-custom-indexer?api-version=2020-06-30" -H "Content-Type: application/json" -H "api-key: $admin_key" -d "@indexer.json"