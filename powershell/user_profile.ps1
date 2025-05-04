# Prompt
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMT_CONFIG = Join-Path (Get-ScriptDirectory) 'user.omp.toml'
oh-my-posh init pwsh --config $PROMT_CONFIG | Invoke-Expression 

# Terminal icons
Import-Module -Name Terminal-Icons

# PSReadline
Set-PSReadlineOption -EditMode Emacs
Set-PSReadlineOption -BellStyle None
Set-PSReadlineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadlineOption -PredictionSource History
Set-PSReadlineOption -PredictionViewStyle ListView

# Alias
#Set-Alias vi nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities

# set NEOVIM config directory
$env:XDG_CONFIG_HOME = "$HOME\.config"
