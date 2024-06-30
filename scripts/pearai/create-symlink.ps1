# Function to create the symbolic link
function Connect-Locations {
    param(
        [string]$targetPath,
        [string]$linkPath
    )
	    # Check if the symbolic link already exists and remove it if it does
    if (Test-Path $linkPath -PathType SymbolicLink) {
        Write-Host "Removing existing symbolic link at '$linkPath'..."
        Remove-Item $linkPath
    }
	
	Start-Sleep 1

    Write-Host "Creating symbolic link '$targetPath' -> '$linkPath'"
    New-Item -ItemType SymbolicLink -Path $linkPath -Target $targetPath
}

# Get the target and link paths from script parameters
$targetPath = $args[0]
$linkPath = $args[1]

# Call the function to create the symbolic link
Connect-Locations -targetPath $targetPath -linkPath $linkPath
