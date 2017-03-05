Function ImportConfig {
<#
.Synopsis
   Check for configuration and output the information.
.DESCRIPTION
   Check for configuration and output the information. Goes into the $env:appdata for the configuration file.
.EXAMPLE
    ImportConfig
#>

if ( $IsWindows ) {
    $ConfigFile = "$env:appdata\PSGitLab\PSGitLabConfiguration.xml"
} elseif ( $IsLinux ) {
    $ConfigFile = "{0}/.psgitlab/PSGitLabConfiguration.xml" -f $HOME
} else {
    Write-Error "Unknown Platform"
}
if (Test-Path $ConfigFile) {
    Import-Clixml $ConfigFile

} else {
    Write-Warning 'No Saved Configration Information. Run Save-GitLabAPIConfiguration.'
    break;
}
}
