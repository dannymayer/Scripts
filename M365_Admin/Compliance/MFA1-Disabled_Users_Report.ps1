$OutputCSVName = "D:\MFADisabledUsersReport_$((Get-Date -format yyyy-MMM-dd-ddd` hh-mm` tt).ToString()).csv" 
Get-MsolUser -All | foreach { 
    $UPN = $_.UserPrincipalName 
    Write-Progress -Activity "`n     Retrieving MFA status "`n"  Currently Processing: $UPN" 
    $UserMFAStatus = $_.StrongAuthenticationRequirements.State 
     if ($UserMFAStatus -ne $null)  
     {   
     $Result = [PSCustomObject]@{  
        "Users Without MFA" = $UPN  
    }  
     # Export the result to a CSV file  
    $Result | Export-Csv -Path $OutputCSVName -NoTypeInformation -Append }  
} 