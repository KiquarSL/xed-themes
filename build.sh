#!/bin/bash
# Build all projects with nodejs
projects=("itsaky" "feslake" "github" "darcula" "tokyo-night")

for i in "${projects[@]}"; do
	cp build.js "$i"
	cd "$i"
    node "build.js"
	cd ..
done