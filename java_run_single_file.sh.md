#!/usr/bin/env bash
# scripts.install=javar

## Compiles and runs a single java file.

JAVA_COMPILATION_UNIT="$1"

compiled_class() {
filename=$(basename "$JAVA_COMPILATION_UNIT")
class_name="${filename%.*}"
echo "$class_name"
}

javac $JAVA_COMPILATION_UNIT && java "$(compiled_class)"  "${@:2}"
