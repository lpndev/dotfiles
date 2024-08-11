$mainFolders = @(
    "$env:USERPROFILE\Games",
    "$env:USERPROFILE\Portable",
    "$env:USERPROFILE\Virtual Machines"
)

$subFolders = @(
    "$env:USERPROFILE\Virtual Machines\Hyper-V",
    "$env:USERPROFILE\Virtual Machines\Hyper-V\Disks",
    "$env:USERPROFILE\Virtual Machines\Hyper-V\Config",
    "$env:USERPROFILE\Virtual Machines\Virtual Box",
    "$env:USERPROFILE\Virtual Machines\WSL"
)

foreach ($folder in $mainFolders + $subFolders) {
    New-Item -ItemType Directory -Path $folder -Force | Out-Null
}

function Add-ToQuickAccess {
    param (
        [string]$Path
    )
    
    $shell = New-Object -ComObject Shell.Application
    $folder = $shell.Namespace($Path).Self
    $folder.InvokeVerb('pintohome')
}

foreach ($folder in $mainFolders) {
    Add-ToQuickAccess -Path $folder
}
