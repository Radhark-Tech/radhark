#!/bin/bash
protoc --proto_path $GOOGLEAPISDIR  --proto_path .  --go_out=generated --go_opt=paths=source_relative --go-grpc_out=generated --go-grpc_opt=paths=source_relative profile.proto auth.proto