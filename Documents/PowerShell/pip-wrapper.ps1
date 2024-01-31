# Check if the first argument is 'install'
if ($args -and $args[0] -eq 'install') {
    # Check if a Python virtual environment is active
    if (-not (Test-Path env:\VIRTUAL_ENV)) {
        # If not in a virtual environment, ask for confirmation
        $response = Read-Host "You are not in a virtual environment. Are you sure you want to continue? (Y/N)"
        if ($response -ne 'Y') {
            Write-Host "Pip install command was cancelled."
            return
        }
    }
}

# Execute the pip command with all arguments
python -m pip $args
