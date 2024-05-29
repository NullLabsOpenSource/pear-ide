#!/bin/bash

# Base functionality
function Base-Functionality {
    echo -e "\nInitializing sub-modules..."
    git submodule update --init --recursive

    cd ./extensions/pearai-submodule || exit

    ./scripts/install-dependencies.sh
}

# Setup all necessary paths for this script
current_dir=$(pwd)
target_path="$current_dir/extensions/pearai-submodule/extensions/vscode"
link_path="$current_dir/extensions/pearai-extension"

# Check if the symbolic link exists
if [ ! -L "$link_path" ]; then
    echo -e "\nCreating symbolic link 'extensions/pearai-submodule/extensions/vscode' -> 'extensions/pearai-extension'"

    # Create the symbolic link
    ln -s "$target_path" "$link_path"
fi

# Run the base functionality
Base-Functionality
