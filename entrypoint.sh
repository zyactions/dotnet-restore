#!/usr/bin/env bash

set -e
set -o pipefail

if sdk_version=$(dotnet --version 2>&1); then
    echo "Using .NET SDK version '$sdk_version'"
else
    echo "::error ::The .NET SDK is not installed"
    exit 1
fi

if version=$(dotnet restore --version 2>&1); then
    echo "Using 'dotnet restore' version '$version'"
else
    echo "::error ::The 'dotnet restore' tool is not installed"
    exit 1
fi

cmd="dotnet restore"

if [[ -n "$INPUT_CONFIGFILE" ]]; then
    cmd+=" --configfile '$INPUT_CONFIGFILE'"
fi

if [[ -n "$INPUT_IGNORE_FAILED_SOURCES" ]]; then
    cmd+=" --ignore-failed-sources"
fi

if [[ -n "$INPUT_FORCE" ]]; then
    cmd+=" --force"
fi

if [[ -n "$INPUT_FORCE_EVALUATE" ]]; then
    cmd+=" --force-evaluate"
fi

if [[ -n "$INPUT_USE_LOCK_FILE" ]]; then
    cmd+=" --use-lock-file"
fi

if [[ -n "$INPUT_LOCK_FILE_PATH" ]]; then
    cmd+=" --lock-file-path '$INPUT_LOCK_FILE_PATH'"
fi

if [[ -n "$INPUT_LOCKED_MODE" ]]; then
    cmd+=" --locked-mode"
fi

eval "$cmd"
