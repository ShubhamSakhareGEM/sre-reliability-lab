#!/bin/bash
echo "Starting load test to trigger HPA..."
# Using a simple loop. Alternatively, install 'hey' (brew install hey) and run: hey -z 30s -c 50 http://localhost:3000/
while true; do
  curl -s http://localhost/ > /dev/null
  echo -n "."
  sleep 0.1
done