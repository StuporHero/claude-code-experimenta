#!/bin/bash
# Simple tests for greet.sh
PASS=0
FAIL=0

# Test 1: Normal greeting
output=$(bash greet.sh "World")
if [ "$output" = "Hello, World!" ]; then
  echo "PASS: Normal greeting"
  ((PASS++))
else
  echo "FAIL: Normal greeting - got '$output'"
  ((FAIL++))
fi

# Test 2: No arguments should fail
bash greet.sh > /dev/null 2>&1
if [ $? -eq 1 ]; then
  echo "PASS: No arguments exits with error"
  ((PASS++))
else
  echo "FAIL: No arguments should exit with error"
  ((FAIL++))
fi

# Test 3: Name with spaces
output=$(bash greet.sh "John Doe")
if [ "$output" = "Hello, John Doe!" ]; then
  echo "PASS: Name with spaces"
  ((PASS++))
else
  echo "FAIL: Name with spaces - got '$output'"
  ((FAIL++))
fi

echo ""
echo "Results: $PASS passed, $FAIL failed"

if [ $FAIL -gt 0 ]; then
  exit 1
fi
