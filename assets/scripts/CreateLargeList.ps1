$TenantName = "defalize"
Connect-PnPOnline -Url "https://$($TenantName)-admin.sharepoint.com" -Interactive
$SiteName = "LargePnPList-2024"
New-PnPSite -Type TeamSite -Title $SiteName -Alias $SiteName
connect-pnponline -Url "https://$($TenantName).sharepoint.com/sites/$sitename" -Interactive
$ListName = "LargeList"
New-PnPList -Title $ListName -Template GenericList
$list = Get-PnPList -Identity $ListName
$NumberFieldName = "NumberField"
$StringFieldName = "StringField"
$ChoiceFieldName = "ChoiceField"
$ChoiceFieldChoices = "1", "2", "3"
1..5 | ForEach-Object {
    add-PnPField -List $list -DisplayName "$($NumberFieldName)_$($_)" -internalName "$($NumberFieldName)_$($_)" -type number
    add-PnPField -List $list -DisplayName "$($stringFieldName)_$($_)" -internalName "$($stringFieldName)_$($_)" -type Text
    add-PnPField -List $list -DisplayName "$($ChoiceFieldName)_$($_)" -internalName "$($ChoiceFieldName)_$($_)" -type Choice -choices $ChoiceFieldChoices
}

$Values = @{
    NumberField_1 = "100"
    NumberField_2 = "200"
    NumberField_3 = "300"
    NumberField_4 = "400"
    NumberField_5 = "500"
    StringField_1 = "100"
    StringField_2 = "200"
    StringField_3 = "300"
    StringField_4 = "400"
    StringField_5 = "500"
    ChoiceField_1 = "1"
    ChoiceField_2 = "2"
    ChoiceField_3 = "3"
    ChoiceField_4 = "1"
    ChoiceField_5 = "2"
}

Measure-Command {
    1..1000 | ForEach-Object {
        Add-PnPListItem -List $list -Values $Values
    }   
}

Measure-Command {
    1..1000 | ForEach-Object {
        Add-PnPListItem -List LargeList -Values $Values
    }   
}

Measure-Command {
    $Batch = new-pnpbatch
    1..1000 | ForEach-Object {
        Add-PnPListItem -List LargeList -Values $Values -batch $batch
    }   
    invoke-pnpbatch $batch
}

Measure-Command {
    $Batch = new-pnpbatch
    $Count = 0
    1..30000 | ForEach-Object {
        $Count++
        Add-PnPListItem -list $List -Values $Values -batch $batch
        if($Count % 2500 -eq 0)
        {
            invoke-pnpbatch $batch
            Write-output "Processed $count"
            $Batch = new-pnpbatch
        }
    }   
    invoke-pnpbatch $batch
}
$Results = 

Write-output "With the text of LargeList"
"1000", "2000", "5000" | foreach-object {
    Measure-Command { Get-PnPListItem -List "LargeList" -PageSize $_  } | select-object "TotalSeconds"
}
Write-output "With the reference to LargeList"
"1000", "2000", "5000" | foreach-object {
    Measure-Command { Get-PnPListItem -List $List -PageSize $_  } | select-object "TotalSeconds"
}
Write-output "With the reference to LargeList and the Fields Title"
$total = 1..10 | Measure-Command {
    Get-PnPListItem -List "LargeList" -PageSize 5000 -Fields Title | select-object "TotalSeconds"
}
Write-output ($total.TotalSeconds / 10)
Write-output "With the reference to $($list.Title) and the Fields Title"
$total = 1..10 | Measure-Command {
    Get-PnPListItem -List $list -PageSize 5000 -Fields Title | select-object "TotalSeconds"
} 
Write-output ($total.TotalSeconds / 10)