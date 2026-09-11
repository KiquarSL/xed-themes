#!/bin/bash
# Control

default="default"

# 1. folder-name
# 2. id
# 3. name
function new {
	local p="themes/$1"
	mkdir "$p"
	
	cp "$default/theme.json" "$p/theme.json"
	cp "$default/manifest.json" "$p/manifest.json"
	sed -i "s|%id%|$2|g" "$default/manifest.json"
	sed -i "s|%name%|$3|g" "$default/manifest.json"
}

# 1. Theme folder name
function build {
	local p="themes/$1"
	if [ ! -d "$p" ]; then
		echo "Theme \`$1\` no exists in folder \`themes\`"
		exit 1
	fi
	(cd "$p" && zip "$OLDPWD/output/$1.xed" ./*)
	echo "Theme \`$1\` builded to output/$1.xed."
}

function build_all {
	for theme in themes/*; do
		build $(basename "$theme")
	done
}

if [ ! -d "output" ]; then
	mkdir "output"
fi

case "$1" in
	"new") new "$2" "$3" "$4" ;;
	"build") build "$2" ;;
	*) echo "Build all themes"
		build_all;;
esac