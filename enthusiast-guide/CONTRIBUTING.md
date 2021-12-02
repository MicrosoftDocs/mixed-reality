---
title: Contributing instructions
description: Learn the basic steps and guidelines for contributing to the Windows Mixed Reality Enthusiast Guide. We appreciate your feedback, edits, additions and help.
author: mattwojo
ms.author: mattwoj
ms.date: 09/16/2020
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Feedback, Feedback Hub, bugs
appliesto:
    - Windows 10
---

# Contributing to the Mixed Reality Enthusiast Guide

Thank you for your interest in the Enthusiast Guide. We appreciate your feedback, edits, additions and help with improving our docs. This page covers the basic steps and guidelines for contributing.

> [!IMPORTANT]
> All repositories that publish to docs.microsoft.com have adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any questions or comments.<br>
>
> Minor corrections or clarifications to documentation and code examples in public repositories are covered by the [docs.microsoft.com Terms of Use](/legal/termsofuse). New or significant changes will generate a comment in the pull request asking you to submit an online Contribution License Agreement (CLA) if you are not an employee of Microsoft. We need you to complete the online form before we can accept your pull request.

## Before you start

If you don't already have one, you'll need to [create a GitHub account](https://github.com/join).

>[!NOTE]
>If you're a Microsoft employee, link your GitHub account to your Microsoft alias on the [Microsoft Open Source portal](https://repos.opensource.microsoft.com/). Join the **"Microsoft"** and **"MicrosoftDocs"** organizations.

When setting up your GitHub account, we also recommend these security precautions:
- Create a [strong password for your Github account](https://github.com/settings/admin).
- Enable [two-factor authentication](https://github.com/settings/two_factor_authentication/configure).
- Save your [recovery codes](https://github.com/settings/auth/recovery-codes) in a safe place.
- Update your [public profile settings](https://github.com/settings/profile).
   - Set your name, and consider setting your *Public email* to *Don't show my email address*.
   - We recommend you upload a profile picture because a thumbnail is shown on docs pages you contribute to.
- If you plan to use the command line, consider setting up [Git Credential Manager for Windows](https://github.com/Microsoft/Git-Credential-Manager-for-Windows/releases/latest). That way, you won't have to enter your password every time you make a contribution.

The publishing system is tied to GitHub, so these steps are important. You'll be listed as either author or contributor to each article using your GitHub alias.

## How to make a change

| To suggest a change to the docs, follow these steps: | Screenshots |
| :------------------- | :--------: |
| 1. If you're viewing a Docs.microsoft.com page, click the **Edit** button in the upper right of the page.  You will be redirected to the corresponding Markdown source file in the [GitHub repository](https://github.com/MicrosoftDocs/mixedreality-enthusiast-guide). | ![Edit Button](images/edit_button.jpg) |
| 2. If you don't already have a GitHub account, click **Sign Up** in the upper right and create a new account. | ![Signup button](images/signup-for-github-button.png)|
| 3. On the corresponding GitHub page that opens, click Edit (the pencil icon). | ![Pencil button](images/pencil_button.jpg)|
| 4. In the Edit file pane, [update the files metadata](#updating-metadata) and use Markdown language to change the content. ([How to write markdown.](https://help.github.com/articles/basic-writing-and-formatting-syntax/))| ![Edit File](images/edit-in-github.png)|
| 5. Click Preview changes to verify the formatting looks as expected. | ![Preview changes](images/edit-in-github.png)|
| 6. When you're done, scroll to the bottom of the page and click "Propose file change", you will be presented with a "Comparing changes" page, allowing you to verify your changes. Then click the "Create pull request" button to submit your changes. At this point you are finished! | ![Propose a change](images/propose.jpg)|

After you submit changes (via a pull request), they will be reviewed by a member of the documentation team. If your request is accepted, updates are published to [https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide](/windows/mixed-reality/enthusiast-guide).

*For internal review only, you can see your changes at [https://review.docs.microsoft.com/windows/mixed-reality/enthusiast-guide](https://review.docs.microsoft.com/en-us/windows/mixed-reality/enthusiast-guide/?branch=main).

### Updating Metadata

Update metadata at the top of each article:
   * **title**: Page title that appears in the browser tab when the article is being viewed. Page titles are used for SEO and indexing, so don't change the title unless necessary (though this is less critical before documentation goes public).
   * **description**: Write a brief description of the article's content, which boosts SEO and discovery.
   * **author**: If you're the primary owner of the page, add your GitHub alias here.
   * **ms.author**: If you're the primary owner of the page, add your Microsoft alias here (you don't need @microsoft.com, just the alias).
   * **ms.date**: Update the date if you're adding major content to the page, but not for fixes like clarification, formatting, grammar, or spelling.
   * **keywords**: Keywords aid in SEO (search engine optimization). Add keywords, separated by a comma and a space, that are specific to your article, but no punctuation after the last keyword in your list. You don't need to add global keywords that apply to all articles, as those are managed elsewhere. 

### Renaming or deleting an existing article

If your change will rename or delete an existing article, be sure to add a redirect. That way, anyone with a link to the existing article will still end up in the right place. Redirects are managed by the .openpublishing.redirection.json file in the root of the repo.

To add a redirect to .openpublishing.redirection.json, add an entry to the `redirections` array:

```json
{
    "redirections": [
        {
            "source_path": "mixed-reality-docs/enthusiast-guide/old-article.md",
            "redirect_url": "new-article#section-about-old-topic",
            "redirect_document_id": false
        },
```

- The `source_path` is the relative repository path to the old article that you're removing. Be sure the path starts with `mixed-reality-docs/enthusiast-guide` and ends with `.md`.
- The `redirect_url` is the relative public URL from the old article to the new article. Be sure that this URL **doesn't** contain `mixed-reality-docs/enthusiast-guide` or `.md`, as it refers to the public URL and not the repository path. Linking to a section within the new article using `#section` is allowed. You can also use an absolute path to another site here, if necessary.
- `redirect_document_id` indicates whether you would like to keep the document ID from the previous file. The default is `false`. Use `true` if you want to preserve the `ms.documentid` attribute value from the redirected article. If you preserve the document ID, data, such as page views and rankings, will be transferred to the target article. Do this if the redirect is primarily a rename, and not a pointer to different article that only covers some of the same content.

If you add a redirect, be sure to delete the old file as well.

### Creating a new article

Use the following workflow to *create new articles* in the documentation repo via GitHub in a web browser:

1. Create a fork off the MicrosoftDocs/mixed-reality/tree/docs/enthusiast-guide 'main' branch (using the **Fork** button in the top right).

   ![Fork the main branch.](images/forkbranch.png)
2. In the "mixed-reality/enthusiast-guide" folder, select **Create new file** in the top right.
3. Create a page name for the article (use hyphens instead of spaces and don't use punctuation or apostrophes) and append ".md"

   ![Name your new page.](images/newpagetitle.PNG)
   
   >[!IMPORTANT]
   >Make sure you create the new article from within the "mixed-reality-docs/enthusiast" folder. You can confirm this by checking for "/mixed-reality-docs/enthusiast-guide" in the new file name line.

4. At the top of your new page, add the following metadata block:

   ```md
   ---
   title:
   description:
   author:
   ms.author:
   ms.date:
   ms.topic: article
   keywords:
   ---
   ```

5. Fill in the relevant metadata fields per the instructions in the [section above](#updating-metadata).
6. Write article content using [Markdown basics](#markdown-basics).
7. Add a `## See also` section at the bottom of the article with links to other relevant articles.
8. When finished, select **Commit new file**.
9. Select **New pull request** and merge your fork's 'main' branch into MicrosoftDocs/mixed-reality/enthusiast-guide 'main' (make sure the arrow is pointing the correct way).

   ![Create pull request from your fork into MicrosoftDocs/mixed-reality/enthusiast-guide](images/pr_to_master.PNG)

## Working with Branches

The [Mixed Reality Enthusiast Guide GitHub repository](https://github.com/MicrosoftDocs/mixed-reality-pr/tree/main/enthusiast-guide) utilizes two main parent branches: [Main](https://github.com/MicrosoftDocs/mixed-reality-pr/tree/main/enthusiast-guide), this content can be reviewed on the [staging site](https://review.docs.microsoft.com/en-us/windows/mixed-reality/enthusiast-guide/?branch=main), and [Live](https://github.com/MicrosoftDocs/mixed-reality-pr/tree/live/enthusiast-guide), for content appearing on the [live site](/windows/mixed-reality/enthusiast-guide).

When making contributions, please submit your Pull Request (PR) to the **Main** branch. This branch can be viewed on the staging site and should only contain contributions that are ready to be published live. You may also create and submit a branch with your own unique branch name which can be selected and viewed in the staging site. (The **Live** branch is only allowed for use by the content administrators.)

## Markdown basics

The following resources will help you learn how to edit documentation using the Markdown language:

- [Markdown basics](https://help.github.com/articles/basic-writing-and-formatting-syntax/)
- [Markdown-at-a-glance reference poster](images/MarkdownPoster.pdf)
- [Additional resources for writing Markdown for docs.microsoft.com](/contribute/how-to-write-use-markdown)

### Adding tables

Because of the way docs.microsoft.com styles tables, they won’t have borders or custom styles, even if you try inline CSS. It will appear to work for a short period of time, but eventually the platform will strip the styling out of the table. So plan ahead and keep your tables simple. [Here’s a site that makes Markdown tables easy](https://www.tablesgenerator.com/markdown_tables).

The [Docs Markdown Extension for Visual Studio Code](/teamblog/docs-extension) also makes table generation easy if you're using [Visual Studio Code (see below)](#using-visual-studio-code) to edit the documentation.

### Adding images

You’ll need to upload your images to the "mixed-reality-docs/images" folder in the repo, and then reference them appropriately in the article. Images will automatically show up at full-size, which means large images will fill the entire width of the article. We recommend pre-sizing your images before uploading them. The recommended width is between 600 and 700 pixels, though you should size up or down if it’s a dense screenshot or a fraction of a screenshot, respectively.

>[!IMPORTANT]
>You can only upload images to your forked repo before merging. So, if you plan on adding images to an article, you'll need to [use Visual Studio Code](#using-visual-studio-code) to add the images to your fork's "images" folder first or make sure you've done the following in a web browser:
>
>1. Forked the MicrosoftDocs/mixed-reality repo.
>2. Edited the article in your fork.
>3. Uploaded the images you're referencing in your article to the "mixed-reality-docs/images" folder in your fork.
>4. Created a **pull request** to merge your fork into the MicrosoftDocs/mixed-reality 'main' branch.
>
>To learn how to set up your own forked repo, follow the instructions for [creating a new article](#creating-a-new-article).

## Previewing your work

While editing in GitHub via a web browser, you can select the **Preview** tab near the top of the page to preview your work before committing. 

>[!NOTE]
>Previewing your changes on review.docs.microsoft.com is only available to Microsoft employees

Microsoft employees: once your contributions have been merged into the 'main' branch, you can review the content before it goes public at https://review.docs.microsoft.com/windows/mixed-reality/enthusiast-guide?branch=main. Find your article using the table of contents in the left column.

## Editing in the browser vs. editing with a desktop client

Editing in the browser is the easiest way to make quick changes, however, there are a few disadvantages:

- You don't get spell-check.
- You don't get any smart-linking to other articles (you have to manually type the article's filename).
- It can be a hassle to upload and reference images.

If you'd rather not deal with these issues, use a desktop client like [Visual Studio Code](https://code.visualstudio.com/) with a couple [helpful extensions](#useful-extensions) when contributing.

## Using Visual Studio Code

For the reasons listed [above](#editing-in-the-browser-vs-editing-with-a-desktop-client), you may prefer using a desktop client to edit documentation instead of a web browser. We recommend using [Visual Studio Code](https://code.visualstudio.com/).

### Setup

Follow these steps to configure Visual Studio Code to work with this repo:

1. In a web browser:
    1. Install [Git for your PC](https://git-scm.com/downloads).
    2. Install [Visual Studio Code](https://code.visualstudio.com/).
    3. [Fork MicrosoftDocs/mixed-reality](#creating-a-new-article) if you haven't already.
    4. In your fork, select **Clone or download** and copy the URL.
2. Create a local clone of your fork in Visual Studio Code:
    1. From the **View** menu, select **Command Palette**.
    2. Type "Git: Clone."
    3. Paste the URL you copied.
    4. Choose where to save the clone on your PC.
    5. Select **Open repo** in the pop-up.

### Editing documentation

Use the following workflow to make changes to the documentation with Visual Studio Code:

>[!NOTE]
>All the guidance for [editing](#how-to-make-a-change) and [creating](#creating-a-new-article) articles, and the [basics of editing Markdown](#markdown-basics), from above applies when using Visual Studio Code as well.

1. Make sure your cloned fork is up to date with the official repo.
   1. In a web browser, create a pull request to sync recent changes from other contributors in MicrosoftDocs/mixed-reality 'main' to your fork (make sure the arrow is pointing the right way).
      
      ![Sync changes from MicrosoftDocs/mixed-reality to your fork](images/sync_repos.PNG)
   2. In Visual Studio Code, select the sync button to sync your freshly updated fork to the local clone.
      
      ![Click the sync button image](images/sync_clone.png)
2. Create or edit articles in your cloned repo using Visual Studio Code.
   1. Edit one or more articles (add images to “images” folder if necessary).
   2. **Save** changes in **Explorer**.
      
      ![Choose "Save all" in Explorer](images/explorer_save.png)
   3. **Commit all** changes in **Source Control** (write commit message when prompted).
      
      ![Choose "Commit all" in Source Control](images/source_control_commit.png)
   4. Select the **sync** button to sync your changes back to origin (your fork on GitHub).
      
      ![Click the sync button](images/sync_back.png)
3. In a web browser, create a pull request to sync new changes in your fork back to MicrosoftDocs/mixed-reality 'main' (make sure the arrow is pointing the correct way).

   ![Create pull request from your fork into MicrosoftDocs/mixed-reality](images/pr_to_master.PNG)

### Useful extensions

The following Visual Studio Code extensions are useful when editing documentation:

- [Docs Markdown Extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=docsmsft.docs-authoring-pack) - Use **Alt+M** to bring up a menu of docs authoring options like:
   - Search and reference images you've uploaded.
   - Add formatting like lists, tables, and docs-specific call-outs like `>[!NOTE]`.
   - Search and reference internal links and bookmarks (links to specific sections within a page).
   - Formatting errors are highlighted (hover your mouse over the error to learn more).
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) - misspelled words will be underlined; right-click on a misspelled word to change it or save it to the dictionary.

## Using issues to provide feedback on Windows Mixed Reality Enthusiast Guide

To provide feedback, or point out a problem, rather than directly modifying actual documentation pages, [create an issue](https://github.com/MicrosoftDocs/mixedreality-enthusiast-guide/issues) and the content owners will do their best to address the issue in a timely fashion.

Be sure to include the topic title and the URL if you are creating an issue regarding a specific page.

Thank you for supporting this content!