<#  
.SYNOPSIS   
Retrieves the amount of file based on a specific filter.  
  
.DESCRIPTION  
The Get-FileCountByFilter.ps1 script crawls a given directory and uses a user definied filter to count the files.  
  
.PARAMETER Path  
Specifies the path to the root directory to start searching and counting.  
  
.PARAMETER Filter  
Specifies the filter that is used to count only the files that apply to this filter.  
  
.INPUTS  
None. You cannot pipe objects to Get-FileCountByFilter.ps1.  
  
.OUTPUTS  
Sytem.Int32. Get-FileCountByFilter returns the number of results found.  
  
.EXAMPLE  
C:\PS> .\Get-FileCountByFilter.ps1 -StartDirectory c:\source\projects\  
#>  
  
[CmdletBinding()]  
param (  
    [Parameter(position=0, Mandatory=$true, ValueFromPipeline=$false, HelpMessage="Provide directory where all the result files are located.")]  
    [string]$StartDirectory  
    )  
      
Get-ChildItem $StartDirectory -Recurse | ? {-not $_.PSIsContainer} | group Extension -NoElement | sort count -desc 
Read-Host -Prompt "Press Enter to exit"