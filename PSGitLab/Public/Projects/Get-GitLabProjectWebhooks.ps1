Function Get-GitLabProjectWebhooks
{
  <#
      .SYNOPSIS
      Get the webhooks assigned to a project

      .DESCRIPTION
      Get the web hooks assigned to aproject

      .PARAMETER Id
      Project Id.

      .PARAMETER Namespace
      Project Namespace.

      .EXAMPLE
      Get-GitLabProjectWebhooks -Id 1
      Get all thw webhooks for project id 1

      .EXAMPLE
      Get-GitLabProjectWebhooks -Namespace Test
      Get all thw webhooks for namespace Test

      .NOTES
    

      .LINK
      https://docs.gitlab.com/ce/api/projects.html#hooks

      .INPUTS

      .OUTPUTS
      GitLab.Project.Webhook
  #>

  [OutputType('GitLab.Project.Webhook')]
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
    URI    = "/projects/$($Project.id)/hooks"
    Method = 'GET'
  }

  QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Webhook'
}
