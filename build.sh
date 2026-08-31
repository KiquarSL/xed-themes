#!/bin/bash
# Build all projects with nodejs
projects=("itsaky" "feslake")

for i in "${projects[@]}"; do
    node "./$i/build.js"
done