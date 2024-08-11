if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Error: You must run this script as an administrator."
    exit 1
}

$commands = @(
    "winget install Microsoft.DirectX",
    "winget install Microsoft.XNARedist",
    "winget install EclipseAdoptium.Temurin.21.JRE",
    "winget install EclipseAdoptium.Temurin.17.JRE",
    "winget install EclipseAdoptium.Temurin.8.JRE"
)

foreach ($command in $commands) {
    try {
        Invoke-Expression $command
    }
    catch {
        Write-Host "Error executing: $command`nError: $_"
    }
}
