#!/bin/sh

mlHost=localhost
mlRestPort=9003
mlXdbcPort=9103

# Credentials for deploying
mlUsername=admin
mlPassword=admin

# Credentials for loading modules
mlRestAdminUsername=admin
mlRestAdminPassword=admin

mlcp=/Users/alewis/mlcp-8.0-5/bin/mlcp.sh

`$mlcp import -host $mlHost -port 9003 -username $mlUsername \
    -password $mlPassword -input_file_path ./FloridaSexOffender-IT-Strat-PoC-2016-04-01.csv \
    -mode local -input_file_type delimited_text -document_type json \
    -generate_uri -output_collections offenders \
    -transform_module /ext/offenders/transforms/transform.sjs \
    -transform_function transform`
