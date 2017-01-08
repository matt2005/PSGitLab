﻿#
# Module manifest for module 'PSGitLab'
#
# Generated by: Nicholas M. Getchell
#
# Generated on: 7/1/2015
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'PSGitLab.psm1'

# Version number of this module.
ModuleVersion = '2.5.0'

# ID used to uniquely identify this module
GUID = 'f844db87-fda8-403b-a7da-bdc00a3f5a58'

# Author of this module
Author = 'Nicholas M. Getchell, Leonhard Schick, and Brooks Collins'

# Company or vendor of this module
# CompanyName = 'Unknown'

# Copyright statement for this module
Copyright = '(c) 2016 PSGitLab. All rights reserved.'

# Description of the functionality provided by this module
Description = 'GitLab API accessable from the Windows PowerShell console'

# Minimum version of the Windows PowerShell engine required by this module
# PowerShellVersion = ''

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = @('PSGitLab.format.ps1xml')

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module
FunctionsToExport = @(
    'Unblock-GitLabUser',
    'Block-GitLabUser',
    'Get-GitLabUser',
    'Remove-GitLabUser',
    'New-GitLabUser',
    "Get-GitLabUserKey",
    'Get-GitLabProject',
    'Get-GitLabProjectEvent',
    'New-GitLabFork',
    'Set-GitLabUser',
    'New-GitLabProject',
    'Set-GitLabProject',
    'Remove-GitLabProject',
    'Save-GitLabAPIConfiguration',
    'Test-GitLabAPI',
    'Search-GitLabUser',
    'Get-GitLabNamespace',
    'Get-GitLabCommitStats',
    'New-GitLabBuild',
    'New-GitLabMergeRequest',
    'Get-GitLabMergeRequest',
    'Set-GitLabMergeRequest',
    'Remove-GitLabMergeRequest',
    'Close-GitLabMergeRequest',
    'New-GitLabMilestone',
    'Get-GitLabMilestone',
    'Set-GitLabMilestone',
    'Close-GitLabMilestone',
    'New-GitLabUserKey',
    'Remove-GitLabUserKey'
    )

# Cmdlets to export from this module
#CmdletsToExport = '*'

# Variables to export from this module
#VariablesToExport = '*'

# Aliases to export from this module
#AliasesToExport = '*'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('PSGitLab',
                 'GitLab',
                 'Git',
                 'CI'
                 'ContinuousIntegration',
                 'Builds',
                 'Repository'
        )

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/ngetchell/PSGitLab/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/ngetchell/PSGitLab'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

