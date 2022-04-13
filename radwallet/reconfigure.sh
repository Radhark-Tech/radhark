#!/bin/bash
RANDOM=$$
NAME=rad-config-$RANDOM

protoc --proto_path $GOOGLEAPISDIR  --proto_path . --descriptor_set_out=api_descriptor.pb --include_imports --include_source_info auth.proto profile.proto
gcloud api-gateway api-configs create $NAME --api=radwallet --project radwallet-dev --grpc-files=api_descriptor.pb,api_config.yaml
gcloud api-gateway gateways update rad-gateway --location us-east1 --api=radwallet --api-config=$NAME