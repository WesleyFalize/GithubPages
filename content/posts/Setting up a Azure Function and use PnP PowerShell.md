---
author:
  - me
title: Setting Up a Azure Function and Use PnP PowerShell
date: 2024-04-16T20:31:09+02:00
description: ""
summary: 
tags:
  - Azure
  - PnP
  - PowerShell
  - Automation
categories:
  - ""
  - Automation
  - Azure
  - PowerShell
series:
  - ""
  - Getting started with Azure Functions
ShowToc: true
TocOpen: true
editPost:
  URL: https://github.com/WesleyFalize/GithubPages/tree/main/content
  Text: Suggest Changes
  appendFilePath: true
draft: "false"
---
## What is an Azure function?

An Azure Function is a serverless compute service that allows you to run small pieces of code without having to worry about the infrastructure. You can use Azure Functions to trigger code on a schedule, respond to events, or connect to other services.

## What is PnP PowerShell?

PnP PowerShell is a set of PowerShell cmdlets that allow you to interact with SharePoint Online and Microsoft 365. You can use PnP PowerShell to automate common tasks in SharePoint, manage site collections, lists, and libraries, and much more.

### Setting up an Azure Function

1. Create an Azure Function App 
2. Create a new Function
3. Add PnP PowerShell module
4. Add authentication
5. Write code using PnP PowerShell

## Create an Azure function app
Go to the Azure Portal and create an Azure function app
![[Creating an Azure function app from the Azure portal.png]]
In the screenshot above you can see all the required settings for setting up an Azure function app. The rest of the settings can be kept default. The end result is as follows:
![[Azure Function basic configuration.png]]
After reviewing the information above you can create the Azure Function app, this will take a couple of minutes. After this you can create a new function.
## Create a new function
After the resource was created on Azure you can then create the new function. This can be done through the graphical interface. 
![[Create a function in the Azure portal.png]]
In future development endeavors using a tool like VS Code or your favorite editor would be beneficial but for this simple function app the Azure portal will suffice. When creating an Azure function you have quite a lot of templates available as you can see below:
![[Azure function PowerShell template options.png]]
Within this example we're just going to use a HTTP trigger but a lot of other options are available. 
We need to put in a function name and the authorization level.
![[Azure function PowerShell Authorization levels.png]]

| Level value   | Description                                                                                             |
| ------------- | ------------------------------------------------------------------------------------------------------- |
| **anonymous** | No API key is required.                                                                                 |
| **function**  | A function-specific API key is required. This is the default value when a level isn't specifically set. |
| **admin**     | The master key is required.                                                                             |
Depending on the use of the Function usually a function authorization is best practice. This makes sure your API doesn't get called from the outside without knowing the authorization information.

## Add the PnP PowerShell module
Updating the Requirements.psd1 module

## Add authentication

## 