# Get the directory of the current PowerShell profile
$profileDir = Split-Path $PROFILE

# Construct the full path to pip-wrapper.ps1
$pipWrapperPath = Join-Path -Path $profileDir -ChildPath "pip-wrapper.ps1"

# Set the alias for pip
Set-Alias -Name pip -Value $pipWrapperPath

function dgit {
    & git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME @args
}




function cht {
    param(
        [string]$argument
    )
    curl "https://cheat.sh/$argument"
}
