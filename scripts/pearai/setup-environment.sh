#!/bin/bash

# Function to execute a command and check its status
execute() {
	local cmd=$1
	local failure_message=$2

	$cmd
	if [ $? -ne 0 ]; then
		echo "Setup | $failure_message"
		exit 1
	fi
}

# Check if the current OS is Windows
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    echo "Setup | This script is intended for Mac/Linux and cannot be run on Windows."
    exit 1
fi

# Setup all necessary paths for this script
app_dir=$(pwd)
target_path="$app_dir/extensions/pearai-submodule/extensions/vscode"
link_path="$app_dir/extensions/pearai-ref"

# Check if the symbolic link exists and remove it if it does
if [ -e "$link_path" ]; then
    if [ -L "$link_path" ]; then
        echo -e "\nRemoving existing symbolic link at '$link_path' before creating a new one."
        rm "$link_path"
    else
        echo -e "\n'$link_path' already exists and is not a symbolic link. Removing it."
        rm -rf "$link_path"
    fi
fi

# Create new symbolic link
echo -e "\nCreating symbolic link '$link_path' -> '$target_path'"
ln -s "$target_path" "$link_path"

# Run the base functionality
echo -e "\nInitializing sub-modules..."

# Clone the submodule extension folder
execute "git submodule update --init --recursive" "Failed to initialize git submodules"

execute "cd ./extensions/pearai-submodule" "Failed to change directory to extensions/pearai-submodule"

echo -e "\nSetting the submodule directory to match origin/main's latest changes..."
# Set the current branch to match the latest origin/main branch for the submodule.
execute "git reset origin/main" "Failed to git reset to origin/main"

# Discard any potential changes or merge conflicts in the working directory or staging area,
# ensuring local branch matches remote branch exactly before checking out main
execute "git reset --hard" "Failed to reset --hard"

execute "git checkout main" "Failed to checkout main branch"

execute "git fetch origin" "Failed to fetch latest changes from origin"

# Make sure the submodule has the latest updates
execute "git pull origin main" "Failed to pull latest changes from origin/main"

execute "./scripts/install-dependencies.sh" "Failed to install dependencies for the submodule"

# Discard the package.json and package-lock.json version update changes
execute "git reset --hard" "Failed to reset --hard after submodule dependencies install"

execute "cd $app_dir" "Failed to change directory to application root"

echo -e "\nSetting up root application..."
pwd

execute "yarn install" "Failed to install dependencies with yarn"
