#!/bin/bash

aws lambda update-function-code \
    --function-name "helloWorld" \
    --zip-file "fileb://./app.zip" \
    --region "us-east-1"