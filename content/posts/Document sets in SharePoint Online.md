---
author:
  - me
title: Document Sets in SharePoint Online
date: 2024-04-23T19:17:44+02:00
description: ""
summary: 
tags:
  - SharePoint
  - ContentManagement
categories:
  - ""
  - Microsoft365
  - SharePoint
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

## What is a document set?
A document set is a feature in SharePoint Online that allows users to group related documents together as a single entity. This can be useful for organizing and managing projects, cases, or any other type of collection that involves multiple documents.

## How to enable a document set


To enable document sets in SharePoint Online, follow these steps:

1. Go to your SharePoint Online site and navigate to the library where you want to create document sets.
2. Click on the settings gear icon and select "Library settings."
3. Under the "Content Types" section, click on "Add from existing site content types."
4. In the "Select Content Types from" dropdown menu, choose "Document Set Content Types."
5. Select the document set content type and click on "Add."
6. Click on "OK" to save your changes.

Once you have enabled document sets in your library, you can start creating document sets by clicking on the "New" dropdown menu and selecting "Document Set." You can then add documents to the document set and manage them as a single entity.

## Benefits of using document sets
- Improved organization: Document sets allow you to group related documents together, making it easier to find and manage them.
- Metadata support: You can add metadata fields to document sets, making it easier to categorize and search for documents.
- Syncing of metadata to child items
# How to create a document set
To create a document set in SharePoint Online, follow these steps:
1. Navigate to the document library where you want to create the document set.
2. Click on the "New" button and select "Document Set" from the dropdown menu.
3. Fill out the required metadata fields for the document set.
4. Click on "Save" to create the document set.
## Creating your own content type
The real strength of a document set starts with the use of custom ones. A Document set can be created locally on a SharePoint site or be synced from the content type hub. A document set always inherits from the Root Document set content type. By creating custom content types you can configure additional metadata fields in the content type to be filled in by users. Within the Document set settings you can configure the following interesting items
- Content types allowed in the document set
- Template files that are deployed with every document set created
- Shared columns, columns that will be synced to all the files within the document set
### How to create a content type
#### Content type hub
The best way to implement content types nowadays is through the content type hub. This is an amazing place where SharePoint admins can create content types and publish them to the organization. This feature can be accessed through the SharePoint admin center. In this admin center you can create content types and if needed additional site columns (these columns contain the custom metadata) in a future post i will discuss all the details regarding the creation of content types. After creating a content type in the content type hub you can pull this one down from all the sites within your tenant and use it. If you want the newest version you can update your content type.

#### SharePoint sites
You can also create a local content type only available on the SharePoint site itself. This content type requires the same configuration as for the content type hub except that all changes are instant after changing and do not require a publish and sync. 