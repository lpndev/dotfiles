$foldersToClean = @(
  "$env:USERPROFILE\AppData\Local\Temp",
  "$env:USERPROFILE\Recent",
  "C:\Windows\Prefetch",
  "C:\Windows\Temp"
)

function Clear-Folder {
  param (
    [string]$FolderPath
  )
  
  if (Test-Path $FolderPath) {
    try {
      Get-ChildItem -Path $FolderPath -Recurse -Force | Remove-Item -Force -Recurse -ErrorAction Stop
      Write-Output "Cleared: $FolderPath"
    }
    catch {
      Write-Warning "Failed to clear $FolderPath`: $_"
    }
  }
  else {
    Write-Warning "Folder not found: $FolderPath"
  }
}

foreach ($folder in $foldersToClean) {
  Clear-Folder -FolderPath $folder
}
