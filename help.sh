#! /bin/bash

# function to automatically create help message from array of options

function INTUI_help(){
    function add_dashes() {
        local n=$1
        local dashes=""
        local dash="-"
        for ((i=0; i<n; i++)); do
            dashes+="${dash}"
        done
        echo "$dashes"
    }
    function sort_options() {
        for option in "${!options[@]}"; do
            sorted_options+=( "$option" )
        done
        IFS=$'\n' sorted_options=($(sort <<<"${sorted_options[*]}"))
        unset IFS
    }
    echo "usage: $1 (options) [arguments]"
    echo ""
    echo "options:"
    sort_options
    for option in ${sorted_options[@]}; do
        size=${#option}
        dashes_number=$(( 40 - size ))
        dashes=$(add_dashes $dashes_number)
        option_line="    ${option} $(echo $dashes) ${options[$option]}"
        echo "$option_line"
    done
    unset options
    unset sorted_options
}


