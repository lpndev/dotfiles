$downloadPath = "$env:USERPROFILE\Downloads"

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

$downloadLinks = @(
  "https://raw.githubusercontent.com/lpndev/dotfiles/main/other/winutil/tweaks.json",
  "https://raw.githubusercontent.com/lpndev/dotfiles/main/other/leodnz-ooshutup10.cfg"
)

$wingetPackages = @{
  Compatibility = @(
    "EclipseAdoptium.Temurin.17.JRE",
    "EclipseAdoptium.Temurin.21.JRE",
    "EclipseAdoptium.Temurin.8.JRE",
    "Microsoft.DirectX",
    "Microsoft.DotNet.DesktopRuntime.7",
    "Microsoft.DotNet.DesktopRuntime.8",
    "Microsoft.VCRedist.2015+.x64",
    "Microsoft.VCRedist.2015+.x86",
    "Microsoft.XNARedist",
    "OpenAL.OpenAL"
  )
  Tools         = @(
    "7zip.7zip",
    "CPUID.HWMonitor",
    "DevToys-app.DevToys",
    "Git.Git",
    "Klocman.BulkCrapUninstaller",
    "Microsoft.PowerShell",
    "Microsoft.PowerToys",
    "Microsoft.VisualStudioCode",
    "Microsoft.WindowsTerminal",
    "MHNexus.HxD",
    "Nilesoft.Shell",
    "PuTTY.PuTTY",
    "RARLab.WinRAR",
    "voidtools.Everything",
    "WinSCP.WinSCP"
  )
  Applications  = @(
    "Audacity.Audacity",
    "Bitwarden.Bitwarden",
    "Brave.Brave",
    "Discord.Discord",
    "Docker.DockerDesktop",
    "dotPDN.PaintDotNet",
    "Flow-Launcher.Flow-Launcher",
    "HeroicGamesLauncher.HeroicGamesLauncher",
    "Obsidian.Obsidian",
    "pizzaboxer.Bloxstrap",
    "PrismLauncher.PrismLauncher",
    "ShareX.ShareX",
    "Spotify.Spotify",
    "Valve.Steam",
    "VideoLAN.VLC"
  )
}

function Invoke-OptimizationScript {
  Start-Process powershell -ArgumentList "-Command irm https://christitus.com/win | iex" -Verb RunAs
}

function Save-Files {
  param (
    [array]$Links,
    [string]$Destination
  )
  foreach ($link in $Links) {
    $fileName = Split-Path $link -Leaf
    $filePath = Join-Path $Destination $fileName
    Invoke-WebRequest -Uri $link -OutFile $filePath
    Write-Host "Downloaded $fileName to $Destination"
  }
}

function Enable-LongPaths {
  Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1
  Write-Host "LongPathsEnabled set to 1."
}

function New-Directories {
  param (
    [array]$Folders
  )
  foreach ($folder in $Folders) {
    New-Item -ItemType Directory -Path $folder -Force | Out-Null
  }
  Write-Host "Directories created."
}

function Add-ToQuickAccess {
  param (
    [array]$Folders
  )
  $shell = New-Object -ComObject Shell.Application
  foreach ($folder in $Folders) {
    $folderItem = $shell.Namespace($folder).Self
    $folderItem.InvokeVerb('pintohome')
  }
  Write-Host "Folders added to Quick Access."
}

function Install-WingetPackages {
  param (
    [hashtable]$Packages
  )
    
  $categories = @("Compatibility", "Tools", "Applications")
    
  foreach ($category in $categories) {
    Write-Host "Installing $category packages..."
    foreach ($package in $Packages[$category]) {
      $command = "winget install $package"
      try {
        Write-Host "Executing: $command"
        Invoke-Expression $command
      }
      catch {
        Write-Host "Error executing: $command`nError: $_"
      }
    }
  }
  Write-Host "Package installation complete."
}

Invoke-OptimizationScript
Save-Files -Links $downloadLinks -Destination $downloadPath
Enable-LongPaths
New-Directories -Folders ($mainFolders + $subFolders)
Add-ToQuickAccess -Folders $mainFolders
Install-WingetPackages -Packages $wingetPackages