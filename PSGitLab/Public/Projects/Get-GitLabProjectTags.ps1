Function Get-GitLabProjectTags
{
<#
    .SYNOPSIS
    Get the Project Tags

    .DESCRIPTION
    Get the Project Tags

    .PARAMETER Id
    Project Id.

    .PARAMETER Namespace
    Project Namespace.

    .EXAMPLE
    Get-GitLabProjectTags -id 1
    Gets the Tags on project id 1
    
    .NOTES

    .LINK

    .INPUTS


    .OUTPUTS
    GitLab.Project.Tag
  #>
[OutputType('GitLab.Project.Tag')]
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
    URI    = "/projects/$($Project.id)/repository/tags"
    Method = 'GET'
  }

  QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Tag'
}
