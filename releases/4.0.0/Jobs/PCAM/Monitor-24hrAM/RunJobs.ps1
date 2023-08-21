Import-Module TaskSchedulerExecute -MinimumVersion 1.0 -ArgumentList ([guid]::NewGuid(), $PSCommandPath) -Force
$elapsed = [System.Diagnostics.Stopwatch]::StartNew()
Set-Location -Path (Split-Path -Parent $PSCommandPath)
Write-Log -loglevel "INFO" -msg "BGN=RunJob"
#-BGN--------------------------------------------------------------------------------------------

$List = Get-ChildItem | where {$_.Extension -eq ".lasx"}
foreach ($lasx in $List)
{
    Invoke-LA2 $lasx.Name
}

#-END--------------------------------------------------------------------------------------------
$elapsed.Stop();
Write-Log -loglevel "INFO" -msg "END=RunJob, Time=$($elapsed.Elapsed.TotalSeconds.ToString())"
