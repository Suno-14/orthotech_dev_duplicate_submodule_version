#!/bin/bash

set -e

REPO_ROOT=$(git rev-parse --show-toplevel)
BUILD_DIR="$REPO_ROOT/.build_hook"

echo ""
echo "[1/3] Checking project structure..."

required_files=(
"CMakeLists.txt"
"src/main.cpp"
"src/calculations.cpp"
"include/calculations.hpp"
)

missing=0

for file in "${required_files[@]}"; do
if [ ! -f "$REPO_ROOT/$file" ]; then
echo "MISSING: $file"
missing=1
else
echo "OK: $file"
fi
done

if [ $missing -ne 0 ]; then
echo ""
echo "ERROR: Required files are missing."
echo "Commit blocked."
exit 1
fi

echo "Structure check passed."

echo ""
echo "[2/3] Configuring and building project..."

mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

if ! cmake .. -DCMAKE_BUILD_TYPE=Debug; then
echo ""
echo "ERROR: CMake configuration failed."
echo "Commit blocked."
exit 1
fi

if ! cmake --build . --parallel; then
echo ""
echo "ERROR: Build failed."
echo "Fix compilation errors before committing."
exit 1
fi

echo "Build passed."

echo ""
echo "[3/3] Checking for TODO/FIXME/HACK markers..."

if grep -RInE "TODO|FIXME|HACK" "$REPO_ROOT/src" "$REPO_ROOT/include" 2>/dev/null; then
echo ""
echo "WARNING: Found TODO/FIXME/HACK markers."
echo "Commit blocked."
exit 1
fi

echo "No TODO/FIXME/HACK markers found."
echo ""
exit 0