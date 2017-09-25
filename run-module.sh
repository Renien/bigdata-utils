#!/bin/sh

# Load the until files
scripts_path=$(dirname $(readlink -f "$0"))
source "${scripts_path}/bash/utils/common-functions.sh"
source "${scripts_path}/bash/hadoop/hive.sh"

# Parse args
read_args $@

function display_hive_help() {
    echo
    echo "Usage: hive util module [option...] f={loc|schema}" >&2
    echo
    echo "   f=loc|l,                   To get the hive table hdfs storage location"
    echo "    params,                   additional parameter required"
    echo "              * db={hive database name}"
    echo "              * table={hive table name}"
    echo "   f=schema|sch,              To get the hive table schema"
    echo "    params,                   additional parameter required"
    echo "              * db={hive database name}"
    echo "              * table={hive table name}"
    echo

    exit 1
}

# The command line help 
function display_help() {
    echo
    echo "Usage: $0 [option...] m={hive|hdfs|hbase}" >&2
    echo
    echo "++++++++++++++++++++: Hive Features :++++++++++++++++++++++"
    display_hive_help
    echo
    echo echo "++++++++++++++++++++: Hive Features :++++++++++++++++++++++"
    echo "   display,                   hadoop-hbase module feature"
    echo

    exit 1
}

# check for the main parameter
case "$m" in
  "hive")	
	
	info "Bash Hadoop-Hive Module..."

    case "$f" in
    	"loc" | "l")
			get_hive_table_location $db $table
			;;
		"schema" | "sch")
			get_hive_table_schema $db $table
			;;
		*)
		# echo show all the hive util features 
		display_hive_help
	;;
	esac

    ;;
  "hdfs")
    info "Bash Hadoop-hdfs Module..."
    ;;
  "hbase")
    info "Bash Hadoop-Hive Module..."
    ;;
  *)    
    # echo help options
	display_help
 ;;
esac