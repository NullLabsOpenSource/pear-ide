# Function to create the symbolic link
function Create-Symlink {
    param(
        [string]$targetPath,
        [string]$linkPath
    )

    Write-Host "Creating symbolic link '$targetPath' -> '$linkPath'"
    New-Item -ItemType SymbolicLink -Path $linkPath -Target $targetPath
}

# Get the target and link paths from script parameters
$targetPath = $args[0]
$linkPath = $args[1]

# Call the function to create the symbolic link
Create-Symlink -targetPath $targetPath -linkPath $linkPath
