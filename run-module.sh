#!/bin/sh

# Load the until files
scripts_path=$(dirname $(readlink -f "$0"))
source "${scripts_path}/bash/utils/common-functions.sh"

# Parse args
read_args $@

# validating args
validate_variable_args "mode" ${mode}

if [ $mode == "hadoop-hive" ]; then
        info "Bash Hadoop-Hive Module..."
else
        error "Unknow Parameter..."
fi