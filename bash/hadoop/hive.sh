#!/bin/sh

function get_hive_table_location() {
	local db=$1
	local table=$2

	# validating args
	validate_variable_args "db" ${db}
	validate_variable_args "table" ${table}

	# Get the hive table hdfs store location
	location=$(hive -e "DESCRIBE FORMATTED ${db}.${table};" | grep Location:)

	# hive hdfs location
	info "${location}"
}


function get_hive_table_schema() {
	local db=$1
	local table=$2

	# validating args
	validate_variable_args "db" ${db}
	validate_variable_args "table" ${table}

	# Get the schema
	hive -e "SHOW CREATE TABLE ${db}.${table};" > ${db}_${table}_create.hql

	info "${db}.${table} hive schema is stored to '${db}_${table}_create.hql' file"
}
