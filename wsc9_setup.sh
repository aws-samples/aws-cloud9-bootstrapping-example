#!/bin/bash
# Simple bash for Workshop C9 Deployment. 
# will move towards real automation tools later on
# (c) by David Surey, Amazon Web Services
# suredavi@amazon.de
# NOT FOR PRODUCTION USE - Only for Workshop purposes
C9STACK="ExampleC9"
PROFILE=$2
REGION=$1 
WORKSHOPUSER="CHANGEME@example.com"

if ! [ -x "$(command -v aws)" ]; then
  echo 'Error: aws cli is not installed.' >&2
  exit 1
fi

export AWS_PROFILE=$PROFILE
export AWS_DEFAULT_REGION=$REGION

echo Building $PROFILE C9

# build the c9 environment
aws cloudformation deploy  --stack-name $C9STACK --capabilities CAPABILITY_IAM --template ./wsc9_instancestack.yaml

exit 0 