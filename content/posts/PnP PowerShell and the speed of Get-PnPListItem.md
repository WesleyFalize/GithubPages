---
author:
  - me
title: PnP PowerShell and the Speed of Get PnPListItem
date: 2024-04-15T20:05:20+02:00
description: ""
summary: ""
tags: 
categories:
  - ""
series:
  - ""
ShowToc: true
TocOpen: true
editPost:
  URL: https://github.com/wesleyfalize/githubpages/content
  Text: Suggest Changes
  appendFilePath: true
draft: "true"
---
## Creating SharePoint list items
### The The basic list item
- Contains 15 columns, 5 text, 5 number and 5 choice columns
```powershell
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
```

### Creating with using the $list object

**Adding them individually with a reference to $list**
```PowerShell
Measure-Command {
    1..1000 | ForEach-Object {
        Add-PnPListItem -List $list -Values $Values
    }  
}
```
TotalSeconds      : 470,6630077
**Adding them individually with the list as text**
```PowerShell
Measure-Command {
    1..1000 | ForEach-Object {
        Add-PnPListItem -List LargeList -Values $Values
    }   
}
```
TotalSeconds      : 636,3353449
**Adding them in batches with the list as text**
```PowerShell
Measure-Command {
    $Batch = new-pnpbatch
    1..1000 | ForEach-Object {
        Add-PnPListItem -List LargeList -Values $Values -batch $batch
    }   
    invoke-pnpbatch $batch
}
```
TotalSeconds      : 36,1697572
**Adding them in batches with the list as a reference to $list**
```PowerShell
Measure-Command {
    $Batch = new-pnpbatch
    1..1000 | ForEach-Object {
        Add-PnPListItem -list $List -Values $Values -batch $batch
    }   
    invoke-pnpbatch $batch
}
```
TotalSeconds      : 34,136757

| Method                       | Duration in seconds | Amount of items | Items per second |
| ---------------------------- | ------------------- | --------------- | ---------------- |
| Reference and individual     | 470                 | 1000            | 2,12766          |
| Text listname and individual | 636                 | 1000            | 1,572327         |
| Text and batch               | 36                  | 1000            | 27,77778         |
| Reference and batch          | 34                  | 1000            | 29,41176         |
## Getting listitems
Getting listitems can be difficult due to the query limit of 5000 for querying a SharePoint list. This limit can be circumvented by narrowing down the search results by filtering through indexed columns. But sometimes this is not possible because the size of data is to big. When this happens the command **Get-PnPListItem** offers a switch called **-PageSize**. There is however a difference in the speed of querying this. For this example we use a list called **LargeList**. This list contains a total of **15** additional fields containing sample data. In the example below we're going to look at the speed between the **-PageSize** and by using the specific **-Fields** parameter to narrow the information we're fetching
The list contains 30000 items
### Testing methods
**Get-PnpListItem  with a pagesize and a hardcoded list **
```PowerShell
Get-PnPListItem -List LargeList -PageSize 1000
```
**Get-PnpListItem  with a pagesize and a referece list **
```PowerShell
Get-PnPListItem -List LargeList -PageSize 1000
```
**Get-PnpListItem  with a pagesize and only fetching the Title**
```PowerShell
Get-PnPListItem -List $list -PageSize 1000 -Fields Title
```
**Get-PnpListItem  with a pagesize and  a reference to $List and only fetching the Title
```PowerShell
Get-PnPListItem -List LargeList -PageSize 1000 -Fields Title
```


