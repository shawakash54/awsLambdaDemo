#!/bin/bash

aws lambda create-function \
    --function-name "helloWorld" \
    --runtime "nodejs8.10" \
    --role "<provide your ARN>" \
    --handler "app/index.handler" \
    --timeout 5 \
    --zip-file "fileb://./app.zip" \
    --region "us-east-1"