$compatibility = @(
    "winget install EclipseAdoptium.Temurin.17.JRE",
    "winget install EclipseAdoptium.Temurin.21.JRE",
    "winget install EclipseAdoptium.Temurin.8.JRE",
    "winget install Microsoft.DirectX",
    "winget install Microsoft.DotNet.DesktopRuntime.7",
    "winget install Microsoft.DotNet.DesktopRuntime.8",
    "winget install Microsoft.VCRedist.2015+.x64",
    "winget install Microsoft.VCRedist.2015+.x86",
    "winget install Microsoft.XNARedist",
    "winget install OpenAL.OpenAL"
)

$tools = @(
    "winget install 7zip.7zip",
    "winget install CPUID.HWMonitor",
    "winget install DevToys-app.DevToys",
    "winget install Git.Git",
    "winget install Klocman.BulkCrapUninstaller",
    "winget install Microsoft.PowerShell",
    "winget install Microsoft.PowerToys",
    "winget install Microsoft.VisualStudioCode",
    "winget install Microsoft.WindowsTerminal",
    "winget install MHNexus.HxD",
    "winget install Nilesoft.Shell",
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
    "winget install dotPDN.PaintDotNet",
    "winget install Flow-Launcher.Flow-Launcher",
    "winget install HeroicGamesLauncher.HeroicGamesLauncher",
    "winget install Obsidian.Obsidian",
    "winget install pizzaboxer.Bloxstrap",
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
