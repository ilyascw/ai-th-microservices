#!/bin/sh
set -eu

version=32.6.10
project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
tools_dir="$project_dir/.tools"
app="$tools_dir/draw.io.app/Contents/MacOS/draw.io"
archive="$tools_dir/draw.io-arm64-$version.zip"
url="https://github.com/jgraph/drawio-desktop/releases/download/v$version/draw.io-arm64-$version.zip"

if [ -x "$app" ]; then
    exit 0
fi

mkdir -p "$tools_dir"
if [ ! -f "$archive" ]; then
    curl -fL --retry 3 "$url" -o "$archive"
fi
ditto -x -k "$archive" "$tools_dir"
test -x "$app"
