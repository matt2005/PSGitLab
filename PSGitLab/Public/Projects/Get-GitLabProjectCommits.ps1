Function Get-GitLabProjectCommits
{
<#
    .SYNOPSIS
    Get the Project Commits

    .DESCRIPTION
    Get the Project Commits

    .PARAMETER Id
    Project Id.

    .PARAMETER Namespace
    Project Namespace.

    .EXAMPLE
    Get-GitLabProjectCommits -id 1
    Gets the Commits on project id 1
    
    .NOTES

    .LINK

    .INPUTS


    .OUTPUTS
    GitLab.Project.Tag
  #>
[OutputType('GitLab.Project.Commit')]
  [cmdletbinding()]
  param(
    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    [Parameter(ParameterSetName = 'Id')]
    [string]$Id,

    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    #[Parameter(ParameterSetName='Namespace')]
    [string]$Namespace
  )

  $Project = $null
  switch ($PSCmdlet.ParameterSetName) {
    'Id' 
    {
      $Project = Get-GitLabProject -Id $Id 
    }
    'Namespace' 
    {
      $Project = Get-GitLabProject -Namespace $Namespace 
    }
  }

  $Request = @{
    URI    = "/projects/$($Project.id)/repository/commits"
    Method = 'GET'
  }

  QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Commit'
}
