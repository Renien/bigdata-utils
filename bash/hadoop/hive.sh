#!/bin/sh

# Load the until files
scripts_path=$(dirname $(readlink -f "$0"))"/../"
source "$scripts_path/utils/common-functions.sh"

# Parse args
read_args $@

# validating args
validate_variable_args "db" ${db}
validate_variable_args "table" ${table}

# Get the hive table hdfs store location
location=$(hive -e "DESCRIBE FORMATTED ${db}.${table};" | grep Location:)

# hive hdfs location
info "${location}"

# Get the schema
hive -e "SHOW CREATE TABLE db_gold.gold_hct_mkt_cld_mpng;" >> table_creation.hql