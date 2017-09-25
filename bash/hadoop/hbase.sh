#!/bin/sh

# Load the until files
scripts_path=$(dirname $(readlink -f "$0"))"/../"
source "$scripts_path/utils/common-functions.sh"

# Parse args
read_args $@

# validating args
validate_variable_args "fileLocation" ${fileLocation}

: '
This will help read row keys and execute 
hbase get key command
'
for line in $(hadoop fs -cat ${fileLocation})
do
	rows=$(echo "get '${table}', 'line', {COLUMN => ['${colFamily}:${colQualifier}'] }" | hbase shell | grep value | grep -o value=.* | cut -f2- -d'=')
	info "${line} : ${rows}"
done
