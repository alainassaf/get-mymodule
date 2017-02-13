Function Get-MyModule {
    Param([string]$modules)
    $ErrorActionPreference= 'silentlycontinue'
        foreach ($mod in $modules.Split(",")) {
            if(-not(Get-Module -name $mod)) {
                if(Get-Module -ListAvailable | Where-Object { $_.name -like $mod }) {
                    Import-Module -Name $mod
                } else {
                    write-warning "$mod PowerShell Module not available."
                    write-warning "Please run this script from a system with the $mod PowerShell Module is installed."
                    exit 1
                }
            }
        }
}

$PSModules = ("activedirectory")
get-mymodule $PSModules
