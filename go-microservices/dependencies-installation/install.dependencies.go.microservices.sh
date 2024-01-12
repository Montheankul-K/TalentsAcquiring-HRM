#!/bin/bash

# current date and timestamp
current_timestamp=$(date +"%Y-%m-%d %H:%M:%S")
current_date=$(date +"%Y-%m-%d")

# set go microservice path
go_mic_path=$(cd .. && pwd)
current_path=$(pwd)

# defind dependencies array
dependencies_arr=("$@")

# defind install dependencies function
function install_dependencies {
    for dependencies in "${dependencies_arr[@]}"; do 
        if go list "$dependency" > /dev/null 2>&1; then
            echo "$dependency is already installed in $install_path"
        else
            if go get "$dependency"; then
                echo "$dependencies is installed in $install_path at $current_timestamp" >> "$current_path/installation-log/installation-log-$current_date.log"
            else 
                echo "failed to install $dependency in $install_path at $current_timestamp" >> "$current_path/installation-log/installation-log-$current_date.log"
            fi
        fi
    done
}

# list service directories name 
for dir in "$go_mic_path"/*-service; do 
    trim_path=$(echo "$dir" | sed "s|$go_mic_path||" | sed "s|/||")
    install_path="$go_mic_path"/$trim_path
    cd $install_path || exit
    install_dependencies
    echo "install dependencies at $install_path finished at $current_timestamp" >> "$current_path/installation-log/installation-log-$current_date.log"
    echo "install dependencies at $install_path finished at $current_timestamp"
    cd ..
done