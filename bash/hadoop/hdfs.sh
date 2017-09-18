#!/bin/sh

echo "Parsing args.."
for item in $@; do
case $item in
(*=*) eval $item;
esac
done

# Get few lines of HDFS data
hadoop fs -cat ${fileLocation} | shuf -n ${N}