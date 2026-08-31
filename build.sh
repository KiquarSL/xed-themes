#!/bin/bash
# Build all projects with nodejs
projects=("itsaky" "feslake" "github" "darcula")

for i in "${projects[@]}"; do
	cp build.js "$i"
	cd "$i"
    node "build.js"
	cd ..
done