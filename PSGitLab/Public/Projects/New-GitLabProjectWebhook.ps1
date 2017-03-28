Function New-GitLabProjectWebhook
{
  <#
      .SYNOPSIS
      Add a New webhook for a Project

      .DESCRIPTION
      Add a new webhook for a project

      .PARAMETER Id
      Project Id.

      .PARAMETER Namespace
      Project Namespace.

      .PARAMETER URL
      Webhook URL.

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
      Security Token fro webhook

      .EXAMPLE
      New-GitLabProjectWebhook -Id 1 -URL 'https:\webhook'
      Setup a webhook on project id 1

      .EXAMPLE
      New-GitLabProjectWebhook -Namespace Value -URL 'https:\webhook'
      Setup and Webhook on namespace Value

      .NOTES
      Place additional notes here.

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
    [parameter(mandatory,HelpMessage = 'WebHook URL')][string]$URL,
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
  $Body = @{
    id  = $Project.id
    url = $URL
  }
  If ($PSBoundParameters.ContainsKey('verbose'))
  {
    $null = $PSBoundParameters.Remove('verbose')
  }
  $PSBoundParameters.Remove('URL')
  If (-not($PSBoundParameters.ContainsKey('enable_ssl_verification')))
  {
    $PSBoundParameters.Add('enable_ssl_verification',$False)
  }
  try 
  {
    foreach($p in $PSBoundParameters.GetEnumerator()) 
    {
      $Body.Add($p.Key, $($p.Value))
    }

    $Request = @{
      URI    = "/projects/$($Project.id)/hooks"
      Method = 'POST'
      Body   = $Body
    }
    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Project.Webhook'
  }
  catch 
  {
    Write-Error -Message $_
  }
}
