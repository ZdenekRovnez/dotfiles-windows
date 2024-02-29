### pip wrapper

# Get the directory of the current PowerShell profile
$profileDir = Split-Path $PROFILE

# Construct the full path to pip-wrapper.ps1
$pipWrapperPath = Join-Path -Path $profileDir -ChildPath "pip-wrapper.ps1"

# Set the alias for pip
Set-Alias -Name pip -Value $pipWrapperPath

function dgit {
    & git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME @args
}

### git info

function git-info {
    param (
        [string]$useDgit
    )

    $gitCommand = "git"

    # use optional argument 'dgit' to use alias 'dgit' 
    if ($useDgit -eq "dgit") {
        $gitCommand = "dgit"
    }

    Write-Output "Repository Summary:"
    Write-Output "--------------------------------------"
    Write-Output "Branches:"
    & $gitCommand branch -a
    Write-Output "--------------------------------------"
    Write-Output "Last 5 Commits:"
    & $gitCommand log --oneline -n 5
    Write-Output "--------------------------------------"
    Write-Output "Repository Status:"
    & $gitCommand status -s
    Write-Output "--------------------------------------"
    Write-Output "Remote Repositories:"
    & $gitCommand remote -v
}

### Miscellaneous

# cheat function (cht)
function cht {
    param(
        [string]$argument
    )
    curl "https://cheat.sh/$argument"
}


