---
author:
  - me
title: SharePoint Content Management 101
date: 2024-04-23T20:57:14+02:00
description: ""
summary: ""
tags:
  - ContentManagement
  - "#SharePoint"
  - ContentTypes
categories:
  - ""
series:
  - ""
  - SharePoint content management 101
ShowToc: true
TocOpen: true
editPost:
  URL: https://github.com/WesleyFalize/GithubPages/tree/main/content
  Text: Suggest Changes
  appendFilePath: true
---
## What will you get out of this series?
This series is intended to increase my depth and breadth of understanding for content management within SharePoint. During the years I've been working with SharePoint i started without a solid foundation on this subject, I've learned on the go and by requirements during projects. During this series i want to go over the basics of content management and from there on dive deeper into the nooks and crannies of content management. During this post we will go over the foundational elements and in additional posts we will dive into detail in these topics
## Content management foundation
The foundation of content management within SharePoint is surprisingly the content. This content can be defined on multiple levels but for the simplicity of getting started we define it as a file or item. A file is a Word or Excel file and an Item is usually a list item like a travel request. SharePoint offers a few core components to manage content
- Version history
- Recycle bin
- Metadata
- Workflows
- Collaboration
### Version history
In the blog post [SharePoint version history](/posts/sharepoint-version-history) we will go a lot deeper into version history. By default version history is enabled on a list. 100 versions can be stored for each file and you are able to go back through all those versions and see the changes. For sparsely used files this means you can go back a very long time. For items that are used often it might create 100 versions in a few days. Especially with collaborating with multiple people the version count increases quickly. From the version history you can open a file and see it at the state it was and then restore it, creating a new version and working from there.
### Recycle bin
For a deeper dive please visit [SharePoint Recycle bin](/posts/sharepoint-recycle-bin) once it's available.
The recycle bin is a important feature of SharePoint online. It is used to give users safety whilst deleting. An item deleted from a SharePoint site will remain in the recycle bin for 93 days if no action is taken. If required to save storage space a folder or file can also be force deleted cleaning up the recycle bin and reducing the storage required. 

### Workflows
For a deeper dive please visit [SharePoint workflows](/posts/sharepoint-workflows) once it's available.

Workflows in SharePoint are automated processes that streamline and standardize business processes. They can be used to automate tasks, route documents for approval, collect feedback, and more. By setting up workflows in SharePoint, organizations can improve efficiency and ensure consistency in their processes.
### Metadata
For a deeper dive please visit [SharePoint metadata](/posts/sharepoint-metadata) once it's available.

#### What is metadata?
Metadata is data about data. In the context of SharePoint, metadata refers to additional information that is used to **describe** and **categorize** content. This can include things like tags, keywords, author information, creation date, and more. By adding metadata to content in SharePoint, users can easily search for and filter content based on specific criteria, making it easier to find what they need.

#### Where can i apply metadata in SharePoint
Metadata can be applied at various levels in SharePoint, including at the document library level, the list level, and at the individual item or file level. By defining and applying metadata to your content, you can improve searchability, categorization, and organization of your content within SharePoint. 

#### Why would i want to use metadata?
Metadata is crucial for efficient content management in SharePoint for several reasons:

1. **Improved searchability**: By adding metadata to your content, you make it easier for users to search and find relevant information quickly.
2. **Enhanced categorization**: Metadata helps in categorizing content based on specific criteria, making it easier to organize and manage large amounts of data.
3. **Facilitates collaboration**: Metadata provides valuable context and information about the content, making it easier for team members to collaborate effectively.
4. **Ensures consistency**: By defining and applying metadata standards, you can ensure consistency in how content is labeled and organized across your SharePoint environment.
5. **Enables automation**: Metadata can be used to automate certain processes, such as routing documents for approval or triggering specific actions based on defined criteria.
metadata plays a crucial role in enhancing the overall content management experience in SharePoint by improving searchability, organization, collaboration, consistency, and automation.

