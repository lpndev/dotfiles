# Define paths and URLs
$downloadPath = "$env:USERPROFILE\Downloads"
$downloadLinks = @(
  "https://raw.githubusercontent.com/lpndev/dotfiles/main/windows/files/ooshutup10.cfg",
  "https://raw.githubusercontent.com/lpndev/dotfiles/main/windows/files/tweaks.json"
)

# Define folder structure
$folderStructure = @{
  "$env:USERPROFILE\Games"            = @()
  "$env:USERPROFILE\Portable"         = @()
  "$env:USERPROFILE\Virtual-Machines" = @(
    "Hyper-V\Config",
    "Hyper-V\Disks",
    "Shared",
    "Virtual-Box",
    "WSL"
  )
}

# Define packages to install
$wingetPackages = @{
  Compatibility = @(
    "EclipseAdoptium.Temurin.17.JRE",
    "EclipseAdoptium.Temurin.21.JRE",
    "EclipseAdoptium.Temurin.8.JRE",
    "Microsoft.DirectX",
    "Microsoft.DotNet.DesktopRuntime.7",
    "Microsoft.DotNet.DesktopRuntime.8",
    "Microsoft.PowerShell",
    "Microsoft.PowerToys",
    "Microsoft.VCRedist.2015+.x64",
    "Microsoft.VCRedist.2015+.x86",
    "Microsoft.WindowsTerminal",
    "Microsoft.XNARedist",
    "OpenAL.OpenAL"
  )
  Tools         = @(
    "7zip.7zip",
    "9P7KNL5RWT25", # SysInternals Suite
    "BleachBit.BleachBit",
    "Cryptomator.Cryptomator",
    "IDRIX.VeraCrypt",
    "Klocman.BulkCrapUninstaller",
    "LocalSend.LocalSend",
    "MHNexus.HxD",
    "PuTTY.PuTTY",
    "Safing.Portmaster",
    "TechPowerUp.NVCleanstall",
    "voidtools.Everything",
    "Wagnardsoft.DisplayDriverUninstaller",
    "winaero.tweaker",
    "WinDirStat.WinDirStat",
    "WinSCP.WinSCP",
    "yt-dlp.yt-dlp"
  )
  Applications  = @(
    "9NKSQGP7F2NH", # WhatsApp
    "Anki.Anki",
    "AnyAssociation.Anytype",
    "Audacity.Audacity",
    "Bitwarden.Bitwarden",
    "Discord.Discord",
    "Docker.DockerDesktop",
    "dotPDN.PaintDotNet",
    "Figma.Figma",
    "Google.AndroidStudio",
    "HeroicGamesLauncher.HeroicGamesLauncher",
    "LibreWolf.LibreWolf",
    "Logitech.GHUB",
    "Microsoft.VisualStudioCode",
    "OBSProject.OBSStudio",
    "Proton.ProtonVPN",
    "Roblox.Roblox",
    "seerge.g-helper"
    "Spotify.Spotify",
    "Valve.Steam"
  )
}

# Function to download files
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

# Function to create directories
function New-Directories {
  param (
    [hashtable]$FolderStructure
  )
  foreach ($parentFolder in $FolderStructure.Keys) {
    New-Item -ItemType Directory -Path $parentFolder -Force | Out-Null
    foreach ($subFolder in $FolderStructure[$parentFolder]) {
      $fullPath = Join-Path $parentFolder $subFolder
      New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
    }
  }
  Write-Host "Directories created."
}

# Function to add folders to Quick Access
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

# Function to install Winget packages
function Install-WingetPackages {
  param (
    [hashtable]$Packages
  )
  
  $orderedCategories = @("Compatibility", "Tools", "Applications")
  
  foreach ($category in $orderedCategories) {
    Write-Host "Installing $category packages..."
    foreach ($package in $Packages[$category]) {
      $command = "winget install $package --accept-package-agreements --accept-source-agreements"
      try {
        Write-Host "Installing: $package"
        Invoke-Expression $command
      }
      catch {
        Write-Host "Error installing: $package`nError: $_"
      }
    }
  }
  Write-Host "Package installation complete."
}

# Main execution
Save-Files -Links $downloadLinks -Destination $downloadPath
New-Directories -FolderStructure $folderStructure
Add-ToQuickAccess -Folders $folderStructure.Keys
Install-WingetPackages -Packages $wingetPackages