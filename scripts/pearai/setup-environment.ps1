# Base functionality
function Initialize-BaseFunctionality {
    Write-Host "`nInitializing sub-modules..." -ForegroundColor White
    git submodule update --init --recursive

    Set-Location .\extensions\pearai-submodule

    .\scripts\install-dependencies.ps1

    Set-Location $currentDir

    Write-Host "`nSetting up root application..." -ForegroundColor White
    yarn install

    .\scripts\code.bat
}

# Setup all nessesary paths for this script
$currentDir = Get-Location
$targetPath = Join-Path -Path $currentDir -ChildPath 'extensions\pearai-submodule\extensions\vscode'
$linkPath = Join-Path -Path $currentDir -ChildPath 'extensions\pearai-extension'
$createLinkScript = Join-Path -Path (Get-Item $MyInvocation.MyCommand.Path).Directory -ChildPath 'create-symlink.ps1'

# Check if the symbolic link exists
if (-not (Test-Path $linkPath -PathType Any)) {
    Write-Host "`nCreating symbolic link 'extensions\pearai-submodule\extensions\vscode' -> 'extensions\pearai-extension'" -ForegroundColor White
    Start-Process powershell.exe -Verb RunAs -ArgumentList ("-Command", "powershell.exe -File '$createLinkScript' '$targetPath' '$linkPath'")
}

# Run the base functionality
Initialize-BaseFunctionality
