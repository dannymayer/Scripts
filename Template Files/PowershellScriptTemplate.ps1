#Requires -Version 7.3
<#
.SYNOPSIS
    A script that performs some task.

.DESCRIPTION
    A detailed description of what the script does.

.PARAMETER InputFile
    The path to the input file.

.PARAMETER OutputFile
    The path to the output file.

.EXAMPLE
    .\\MyScript.ps1 -InputFile C:\\input.txt -OutputFile C:\\output.txt

    Runs the script with the specified input and output files.
#>

param(
    [Parameter(Mandatory = $true)]
    [ValidateScript({ Test-Path $_ })]
    [string]$InputFile,

    [Parameter(Mandatory = $true)]
    [ValidateScript({ -not (Test-Path $_) })]
    [string]$OutputFile
)

#region Variables

$ErrorActionPreference = 'Stop'

#endregion

#region Functions

function Get-SomeData {
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string]$Input
    )

    process {
        # Some code that gets some data from the input
        Write-Output $Data
    }
}

function Set-SomeData {
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string]$Output,

        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [string]$Data
    )

    process {
        # Some code that sets some data to the output
        Write-Output $Result
    }
}

#endregion

#region Main

Write-Verbose "Starting the script"

$Params = @{
    Path     = $InputFile
    Encoding = 'UTF8'
}

$InputData = Get-Content @Params | Get-SomeData

$Params = @{
    Path     = $OutputFile
    Encoding = 'UTF8'
}

$OutputData = $InputData | Set-SomeData | Set-Content @Params

Write-Verbose "Ending the script"

#endregion