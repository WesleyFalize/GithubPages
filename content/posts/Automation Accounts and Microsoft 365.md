---
author:
  - me
title: Automation Accounts and Microsoft 365
date: 2024-04-10T20:18:49+02:00
description: What is an automation account and how to use it in conjunction with Microsoft 365
summary: Automation accounts in Microsoft 365 can be integrated using PowerShell modules like MgGraph, ExchangeOnline, PnPPowerShell, and MicrosoftTeams. Different types of identities, such as system assigned managed identities, user assigned managed identities, and app registrations with certificates, can be used for authentication. Restricting the use of user assigned managed identities and app registrations in favor of system assigned managed identities can help minimize security risks and ensure a more streamlined and controlled automation process within Microsoft 365.
tags:
  - Azure
  - Automation
  - PowerShell
categories:
  - Azure
  - PowerShell
series:
  - Getting started with Azure automation
ShowToc: true
TocOpen: true
draft: "true"
---
## What is an Azure Automation account?
An Azure Automation account is a cloud-based automation and configuration management service provided by Microsoft Azure. It allows users to automate manual, time-consuming, and repetitive tasks across Azure and non-Azure environments. With an Automation account, users can create, monitor, manage, and deploy resources at scale through runbooks or workflows.

## How do Automation accounts integrate with Microsoft 365?
Automation accounts can integrate with Microsoft 365 by using the various PowerShell modules to automate various tasks within the Microsoft 365 environment. This integration allows for the automation of tasks such as user provisioning, license management, email communication, document management, and more.

## PowerShell modules used within Microsoft 365

- MgGraph : The MgGraph is a powerful tool for automating tasks within Microsoft 365. With its ability to connect to various Microsoft 365 services, it allows for seamless automation of processes such as user management, data extraction, and reporting.

- ExchangeOnline: This module allows for the management of Exchange Online, including email and calendar management, as well as mailbox and distribution list management.

- PnPPowerShell: This module allows for the management of SharePoint Online, including site and document library management, as well as content and permissions management.

- MicrosoftTeams: This module allows for the management of Microsoft Teams, including team and channel management, as well as messaging and meeting management.

## Connecting to a Automation account
To connect to an automation account in a modern scenario you have system assigned managed identities, user assigned managed identities and App registrations

 **System assigned managed identities**: These are automatically created by Azure and are tied to a specific Azure resource, such as a virtual machine or an Azure function. They can be used to authenticate and access resources within the same Azure subscription.

**User assigned managed identities**: These are created and managed separately from the Azure resources and can be assigned to one or more resources. They provide more flexibility and control over the management of identities.

**Certificate based app registrations**: These are used to authenticate applications with Azure AD using a certificate instead of a password. This provides an additional layer of security for the application.

| Identity Type     | Benefits                                              | Drawbacks                                  |
| ----------------- | ----------------------------------------------------- | ------------------------------------------ |
| System assigned   | Automatically created and managed by Azure            | Tied to a specific Azure resource          |
| User assigned     | More flexibility and control over identity management | Requires separate management of identities |
| Certificate based | Additional security with certificate authentication   | Management of certificates can be complex  |

These different types of identities provide various levels of control, flexibility, and security for accessing resources within an automation account in Microsoft 365.

## Authentication
### MgGraph
```powershell
# System assigned managed identity
Connect-MgGraph -Identity 
# User assigned managed identity
Connect-MgGraph -Identity -ClientId "Managed_Identity_Client_ID"
# Application registration with certificate
Connect-MgGraph -ClientId "ClientID" -TenantId "YOUR_TENANT_ID" -CertificateThumbprint "CERT_THUMBPRINT"
```
### ExchangeOnline
```powershell
# System assigned managed identity
Connect-ExchangeOnline -ManagedIdentity
# User assigned managed identity
Connect-ExchangeOnline -ManagedIdentity -ManagedIdentityAccountId "Managed_Identity_Object_ID"
# Application registration with certificate
Connect-ExchangeOnline -AppId "ClientID" -CertificateThumbprint "CERT_THUMBPRINT" -Organization "Tenant.onmicrosoft.com"
```
### PnPPowerShell
```powershell
# System assigned managed identity
Connect-PnPOnline -Url "SharePointUrl" -ManagedIdentity
# User assigned managed identity
Connect-PnPOnline -Url "SharePointUrl" -ManagedIdentity -UserAssignedManagedIdentityClientId "ClientId"
Connect-PnPOnline -Url "SharePointUrl" -ManagedIdentity -UserAssignedManagedIdentityObjectId "ObjectId"
# Application registration with certificate
Connect-PnPOnline -Url "SharePointUrl" -ClientId "ClientId" -Tenant "Tenant.onmicrosoft.com" -Thumbprint "CERT_THUMBPRINT"
```
### MicrosoftTeams
```powershell
# System assigned managed identity
Connect-MicrosoftTeams -Identity
# User assigned managed identity
Connect-MicrosoftTeams -Identity -AccountId "ObjectId"
# Application registration with certificate
Connect-MicrosoftTeams -CertificateThumbprint "CERT_THUMBPRINT" -ApplicationId "ClientId" -TenantId "TenantId"
```
## General advice
Restricting the use of user assigned managed identities and app registrations in favor of System assigned managed identities can help minimize potential security risks and ensure a more streamlined and controlled automation process within Microsoft 365. By leveraging system assigned managed identities, organizations can better manage the lifecycle of their resources and limit the impact of identity connections. This approach ultimately enhances security and simplifies management within automation accounts in Microsoft 365.