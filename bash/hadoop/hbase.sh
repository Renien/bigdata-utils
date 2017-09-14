#!/bin/sh

# This will help read row keys and execute hbase get key command
for line in $(hadoop fs -cat /staged/reports/propensity_coverage/no_prop_atg_id_report/missing_ids/part-00000)
do
	echo "$line"
	rows=$(echo "get '$table', 'line', {COLUMN => ['rec:176'] }" | hbase shell | grep value | grep -o value=.* | cut -f2- -d'=')
	echo "The row value: $rows"
done
