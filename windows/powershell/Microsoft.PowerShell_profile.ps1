$Env:KOMOREBI_CONFIG_HOME = 'C:\Users\$env:USERNAME\.config\komorebi'

Import-Module -Name Terminal-Icons
Invoke-Expression (&starship init powershell)

fastfetch