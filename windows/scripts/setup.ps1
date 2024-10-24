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
    "Git.Git",
    "IDRIX.VeraCrypt",
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
    "RevoUninstaller.RevoUninstaller",
    "seerge.g-helper",
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
    if (Test-Path $filePath) {
      Write-Host "$fileName already exists in $Destination" -ForegroundColor Yellow
    }
    else {
      try {
        Invoke-WebRequest -Uri $link -OutFile $filePath -ErrorAction Stop
        Write-Host "Downloaded $fileName to $Destination" -ForegroundColor Green
      }
      catch {
        Write-Host "Failed to download $fileName $_" -ForegroundColor Red
      }
    }
  }
}

# Function to create directories
function New-Directories {
  param (
    [hashtable]$FolderStructure
  )
  foreach ($parentFolder in $FolderStructure.Keys) {
    if (!(Test-Path $parentFolder)) {
      try {
        New-Item -ItemType Directory -Path $parentFolder -Force -ErrorAction Stop | Out-Null
        Write-Host "Created directory $parentFolder" -ForegroundColor Green
      }
      catch {
        Write-Host "Error creating directory $parentFolder $_" -ForegroundColor Red
      }
    }
    else {
      Write-Host "Directory $parentFolder already exists" -ForegroundColor Yellow
    }
    foreach ($subFolder in $FolderStructure[$parentFolder]) {
      $fullPath = Join-Path $parentFolder $subFolder
      if (!(Test-Path $fullPath)) {
        try {
          New-Item -ItemType Directory -Path $fullPath -Force -ErrorAction Stop | Out-Null
          Write-Host "Created directory $fullPath" -ForegroundColor Green
        }
        catch {
          Write-Host "Error creating directory $fullPath $_" -ForegroundColor Red
        }
      }
      else {
        Write-Host "Directory $fullPath already exists" -ForegroundColor Yellow
      }
    }
  }
}

# Function to pin items to Quick Access
function Add-ToQuickAccess {
  param (
    [array]$Folders, # Folders to pin
    [switch]$IncludeRecycleBin  # Pin Recycle bin
  )

  $shell = New-Object -ComObject Shell.Application
  $quickAccess = $shell.Namespace('shell:::{679f85cb-0220-4080-b29b-5540cc05aab6}')

  # Helper function to pin items to Quick Access
  function Add-ItemToQuickAccess($itemPath) {
    # Check if the item is already pinned
    $isPinned = $false
    foreach ($existingItem in $quickAccess.Items()) {
      if ($existingItem.Path -eq $itemPath) {
        $isPinned = $true
        break
      }
    }
  
    # Pin the item if not already pinned
    if ($isPinned) {
      Write-Host "$itemPath is already pinned to Quick Access" -ForegroundColor Yellow
    }
    else {
      try {
        $itemToPin = $shell.Namespace($itemPath).Self
        $itemToPin.InvokeVerb('pintohome')
        Write-Host "Added $itemPath to Quick Access" -ForegroundColor Green
      }
      catch {
        Write-Host "Failed to add $itemPath to Quick Access: $_" -ForegroundColor Red
      }
    }
  }

  # Pin the Recycle Bin if specified
  if ($IncludeRecycleBin) {
    Add-ItemToQuickAccess 'shell:::{645FF040-5081-101B-9F08-00AA002F954E}'  # Special ID for Recycle Bin
  }

  # Pin each folder
  foreach ($folder in $Folders) {
    Add-ItemToQuickAccess $folder
  }
}

# Function to install Winget packages
function Install-WingetPackages {
  param (
    [hashtable]$Packages
  )

  $orderedCategories = @("Compatibility", "Tools", "Applications")
  $totalPackages = ($Packages.Values | ForEach-Object { $_.Count } | Measure-Object -Sum).Sum
  $installedPackages = 0
  
  foreach ($category in $orderedCategories) {
    Write-Host "Installing $category packages..." -ForegroundColor Cyan
    foreach ($package in $Packages[$category]) {
      $installedPackages++
      $percentComplete = ($installedPackages / $totalPackages) * 100

      # Displays progress correctly with progress bar and installation status
      Write-Progress -Activity "Installing Packages" -Status "Installing: $package" -PercentComplete $percentComplete

      # Winget installation command
      $command = "winget install $package --silent --disable-interactivity --accept-package-agreements --accept-source-agreements"
      try {
        $output = Invoke-Expression $command
        if ($output -match "Successfully installed") {
          Write-Host "Successfully installed $package" -ForegroundColor Green
        }
        elseif ($output -match "already installed") {
          Write-Host "$package is already installed" -ForegroundColor Yellow
        }
        else {
          Write-Host "Installation of $package may have failed. Please check." -ForegroundColor Yellow
        }
      }
      catch {
        Write-Host "Error installing: $package`nError: $_" -ForegroundColor Red
      }
    }
  }

  # Finalizing the progress bar
  Write-Progress -Activity "Installing Packages" -Completed
  Write-Host "Package installation complete." -ForegroundColor Green
}

# Main execution
Save-Files -Links $downloadLinks -Destination $downloadPath
New-Directories -FolderStructure $folderStructure
Add-ToQuickAccess -Folders $folderStructure.Keys -IncludeRecycleBin
Install-WingetPackages -Packages $wingetPackages.
