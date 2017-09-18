#!/bin/sh

# This will help read row keys and execute hbase get key command
for line in $(hadoop fs -cat ${fileLocation})
do
	echo "$line"
	rows=$(echo "get '${table}', 'line', {COLUMN => ['${colFamily}:${colQualifier}'] }" | hbase shell | grep value | grep -o value=.* | cut -f2- -d'=')
	echo "The row value: $rows"
done
