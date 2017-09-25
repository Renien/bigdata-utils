#!/bin/sh

# Load the until files
scripts_path=$(dirname $(readlink -f "$0"))"/../"
source "$scripts_path/utils/common-functions.sh"

# Parse args
read_args $@

# validating args
validate_variable_args "fileLocation" ${fileLocation}
validate_variable_args "N" ${N}

# Get few lines of HDFS data
hadoop fs -cat ${fileLocation} | shuf -n ${N}