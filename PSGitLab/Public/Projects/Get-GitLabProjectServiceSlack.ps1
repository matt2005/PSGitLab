Function Get-GitLabProjectServiceSlack
{
<#
    .SYNOPSIS
    Get the Slack Webhook

    .DESCRIPTION
    Gets Slack notification settings from gitlab

    .PARAMETER Id
    Project Id.

    .PARAMETER Namespace
    Project Namespace.

    .EXAMPLE
    Get-GitLabProjectServiceSlack -Webhook https://hooks.slack.com/asfdss -Id 1
    Gets the Slack Settings on project id 1
    
    .NOTES

    .LINK
    https://docs.gitlab.com/ce/api/services.html#get-slack-service-settings

    .INPUTS


    .OUTPUTS
    GitLab.Project.Service.Slack
  #>
[OutputType('GitLab.Project.Service.Slack')]
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
    URI    = "/projects/$($Project.id)/services/slack"
    Method = 'GET'
  }

  QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Service.Slack'
}
