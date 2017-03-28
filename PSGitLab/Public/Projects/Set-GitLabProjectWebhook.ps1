Function Set-GitLabProjectWebhook
{
  <#
    .SYNOPSIS
    Set a setting on the Project webhook

    .DESCRIPTION
    Set a setting on the Project webhook

    .PARAMETER Id
    Project Id.

    .PARAMETER Namespace
    Project Namespace.

    .PARAMETER URL
    Webhook URL.

    .PARAMETER hook_id
    Webhook hook_id.

    .PARAMETER push_events
    Send on push_events.

    .PARAMETER issues_events
    Send on issues_events.

    .PARAMETER merge_requests_events
    Send on merge_requests_events.

    .PARAMETER tag_push_events
    Send on tag_push_events.

    .PARAMETER note_events
    Send on note_events.

    .PARAMETER pipeline_events
    Send on pipeline_events.

    .PARAMETER wiki_events
    Send on wiki_events.

    .PARAMETER enable_ssl_verification
    enable_ssl_verification.

    .PARAMETER Token
    Webhook Secure Token.

    .EXAMPLE
    Set-GitLabProjectWebhook -Id 1 -URL http123 -hook_id 1
    Set a URL on Project ID 1 webhook id 1

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
    [parameter(mandatory,HelpMessage='Webhook URL')][string]$URL,
    [parameter(mandatory,HelpMessage='Hook ID')][string]$hook_id,
    [switch]$push_events,
    [switch]$issues_events,
    [switch]$merge_requests_events,
    [switch]$tag_push_events,
    [switch]$note_events,
    [switch]$pipeline_events,
    [switch]$wiki_events,
    [switch]$enable_ssl_verification,
    [string]$Token
        
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
    id  = $Project.id
    url = $URL
  }
  $null = $PSBoundParameters.Remove('URL')
  try 
  {
    foreach($p in $PSBoundParameters.GetEnumerator()) 
    {
      $Body.Add($p.Key, $($p.Value))
    }

    $Request = @{
      URI    = "/projects/$($Project.id)/hooks/$hook_id"
      Method = 'PUT'
      Body   = $Body
      ContentType = 'application/x-www-form-urlencoded'
    }
    $Body
    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Webhook'
  }
  catch 
  {
    Write-Error -Message $_
  }
}
