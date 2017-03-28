Function Remove-GitLabProjectWebhook
{
  <#
      .SYNOPSIS
      Remove a webhook assigned to a project

      .DESCRIPTION
      Remove a webhook assigned to a project

      .PARAMETER Id
      Project Id.

      .PARAMETER Namespace
      Project Namespace.

      .PARAMETER hook_id
      Webhook ID

      .EXAMPLE
      Remove-GitLabProjectWebhooks -Id 1 -hook_id 1
      Remove webhook ID 1 for project id 1

      .EXAMPLE
      Remove-GitLabProjectWebhooks -Namespace Test -hook_id 1
      Remove webhook ID 1 for namespace Test

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
    [string]$Namespace,
    [parameter(mandatory,HelpMessage = 'Webhook id')][string]$hook_id
        
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
    id      = $Project.id
    url     = $URL
    hook_id = $hook_id
  }
  try 
  {
    $Request = @{
      URI    = "/projects/$($Project.id)/hooks/$hook_id"
      Method = 'DELETE'
      Body   = $Body
    }
    $Body
    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Webhook'
  }
  catch 
  {
    Write-Error -Message $_
  }
}
