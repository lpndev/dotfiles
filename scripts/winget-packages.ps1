if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Error: You must run this script as an administrator."
    exit 1
}

$compatibility = @(
    "winget install Microsoft.DirectX",
    "winget install Microsoft.XNARedist",
    "winget install EclipseAdoptium.Temurin.21.JRE",
    "winget install EclipseAdoptium.Temurin.17.JRE",
    "winget install EclipseAdoptium.Temurin.8.JRE"
)

$tools = @(
    "winget install Anki.Anki",
    "winget install CPUID.HWMonitor",
    "winget install DevToys-app.DevToys",
    "winget install Klocman.BulkCrapUninstaller",
    "winget install Microsoft.VisualStudioCode",
    "winget install MHNexus.HxD",
    "winget install PuTTY.PuTTY",
    "winget install RARLab.WinRAR",
    "winget install voidtools.Everything",
    "winget install WinSCP.WinSCP"
)

$applications = @(
    "winget install Audacity.Audacity",
    "winget install Bitwarden.Bitwarden",
    "winget install Brave.Brave",
    "winget install Discord.Discord",
    "winget install Docker.DockerDesktop",
    "winget install Flow-Launcher.Flow-Launcher",
    "winget install HeroicGamesLauncher.HeroicGamesLauncher",
    "winget install Obsidian.Obsidian",
    "winget install PrismLauncher.PrismLauncher",
    "winget install ShareX.ShareX",
    "winget install Spotify.Spotify",
    "winget install Valve.Steam",
    "winget install VideoLAN.VLC"
)

$compatibility = $compatibility | Sort-Object
$tools = $tools | Sort-Object
$applications = $applications | Sort-Object

$categories = @($compatibility, $tools, $applications)
foreach ($category in $categories) {
    foreach ($command in $category) {
        try {
            Write-Host "Executing: $command"
            Invoke-Expression $command
        }
        catch {
            Write-Host "Error executing: $command`nError: $_"
        }
    }
}
