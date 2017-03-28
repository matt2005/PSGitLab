Function Set-GitLabProjectServiceSlack
{
  <#
    .SYNOPSIS
    Set the Slack Webhook

    .DESCRIPTION
    Enables Slack notification from gitlab

    .PARAMETER Id
    Project Id.

    .PARAMETER Namespace
    Project Namespace.

    .PARAMETER webhook
    Slack webhook.

    .EXAMPLE
    Set-GitLabProjectServiceSlack -Webhook https://hooks.slack.com/asfdss -Id 1
    Sets the webhook on project id 1
    
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
    [string]$Namespace,
    [parameter(mandatory,HelpMessage='Slack Webhook')][string]$webhook 
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
  $Body = @{
    webhook = $webhook
  }
  $null = $PSBoundParameters.Remove('webhook')
  try 
  {
    $Request = @{
      URI         = "/projects/$($Project.id)/services/slack"
      Method      = 'PUT'
      Body        = $Body
      ContentType = 'application/x-www-form-urlencoded'
    }
    $Body
    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Service.Slack'
  }
  catch 
  {
    Write-Error -Message $_
  }
}
