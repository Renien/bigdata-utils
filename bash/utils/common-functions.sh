#!/bin/sh

: '
This file is a common module utils that
has functions to help other bigdata 
until scripts 
'

# Print Informative messages
function info() {
    echo [INFO] $1
}

# Print error messages
function error() {
    echo [ERROR] $1
}

# Print warning messages
function warning() {
    echo [WARN] $1
}

# Throw exception shutdown the execution
function exit_with_message() {
    error "$1"
    exit 1
}

# Read all the parameters
function read_args() {
    info "Start: Parsing args..."
    for item in $@; do
		case $item in
			(*=*) eval $item;
		esac
	done
    info "End: Parsing args..."
}

: '
Checks if the variable is set 
or exit with a error message
'
function validate_variable_args() {
    local var_name=$1
    local var_value=$2

    if [ ! -z ${var_value} ]; then
        info "${var_name} is set to '${var_value}'"
    else
        error "${var_name} is unset";
        exit 1
    fi
}