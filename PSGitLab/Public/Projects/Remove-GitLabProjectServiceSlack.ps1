Function Remove-GitLabProjectServiceSlack
{
  <#
    .SYNOPSIS
   Remove Slack Webhook

    .DESCRIPTION
    Disables Slack notification from gitlab

    .PARAMETER Id
    Project Id.

    .PARAMETER Namespace
    Project Namespace.
    
    .EXAMPLE
    Remove-GitLabProjectServiceSlack -Id 1
    Disables Slack Notification on project id 1
    
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
      $null = $PSBoundParameters.Remove('Id')
    }
    'Namespace' 
    {
      $Project = Get-GitLabProject -Namespace $Namespace
      $null = $PSBoundParameters.Remove('Namespace')
    }
  }
  If ($PSBoundParameters.ContainsKey('verbose'))
  {
    $null = $PSBoundParameters.Remove('verbose')
  }

  try 
  {
    $Request = @{
      URI    = "/projects/$($Project.id)/services/slack"
      Method = 'DELETE'
    }
    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Services.Slack'
  }
  catch 
  {
    Write-Error -Message $_
  }
}
