# Contributing to Windows Mixed Reality developer documentation

Welcome to the [public repo for Windows Mixed Reality developer documentation](https://github.com/MicrosoftDocs/mixed-reality/tree/master/mixed-reality-docs)! Any articles you create or edit in this repo **will be visible to the public.** Windows Mixed reality docs are now on the docs.microsoft.com platform, which uses GitHub-flavored Markdown. This page covers the basic steps and guidelines for contributing, as well as links to Markdown basics. Thank you for your contribution! 

## Before you start
If you don't already have one, you'll need to create a GitHub account ([https://github.com/join](https://github.com/join)) and link it to your Microsoft alias (if you're a Microsoft employee) on the Microsoft Open Source portal ([https://repos.opensource.microsoft.com/](https://repos.opensource.microsoft.com/) -- Join the **"Microsoft"** and **"MicrosoftDocs"** organizations).  

When setting up your account, we also recommend these security precautions:
- Create a [strong password for your Github account](https://github.com/settings/admin).
- Enable [two-factor authentication](https://github.com/settings/two_factor_authentication/configure).
- Save your [recovery codes](https://github.com/settings/auth/recovery-codes) in a safe place.
- Update your pubic profile settings on the top right of your profile (https://github.com/your_name), select the drop-down arrow next to your profile photo on the top right, then select *Settings*, set your name and consider setting your *Public email* to *Don't show my email address*. We also recommend that you upload a profile picture as a thumbnail will be shown on docs pages that you contribute to. 
- If you plan to use a command line workflow, consider setting up [Git Credential Manager for Windows](https://github.com/Microsoft/Git-Credential-Manager-for-Windows/releases/latest) so that you don't have to enter your password each time you make a contribution. 
Taking these steps is important as the publishing system is tied to GitHub and you'll be listed as either author or contributor to each article using your GitHub alias.

## Editing an existing article

Use the following workflow to make updates to the documentation:
* Navigate to the article you wish to edit.
* Click the edit button (pencil icon) in the top right. This will automatically fork a disposable branch off master.

  ![Edit an article.](images/editpage.png)
* Edit the content of the article (see "Mardown basics" below for guidance).
* Update metadata as relevant at the top of each article:
    * title: This is the page title that appears in the browser tab when the article is being viewed. As this is used for SEO and indexing, you shouldn't change the title unless necessary (though this is less critical before documentation goes public).
    * description: Write a brief description of the article's content. This aids in SEO and discovery.
    * author: If you are the primary owner of the page, add your GitHub alias here.
    * ms.author: If you are the primary owner of the page, add your Microsoft alias here (you don't need @microsoft.com, just the alias).
    * ms.date: Update the date if you're adding major content to the page, but not for fixes like clarification, formatting, grammar, or spelling.
    * keywords: Keywords aid in SEO. Add keywords, separated by a comma and a space, that are specific to your article (but no punctuation after the last keyword in your list); you don't need to add global keywords that apply to all articles as those are managed elsewhere. 
* When finished, scroll down and click the **Propose file change** button.
* On the next page, click **Create pull request** to merge your automatically created branch into master.
* After the pull request is completed, the site admin will delete your branch (this is easiest, so you don't have to keep it in sync with master).
* Repeat!

## Creating a new article

Use the following workflow to create new articles in the documentation:
* Create a fork off the master branch (using the **Fork** button in the top right).

  ![Fork the master branch.](images/forkbranch.png)
* In the **mixed-reality-docs** folder, click the **Create new file** button in the top right.
* Create a page name for the article (use hyphens instead of spaces and don't use punctuation or apostrophes) and append ".md"

  ![Name your new page.](images/newpagetitle.PNG)
* At the top of your new page, add the following metadata block:
```md
---
title: 
description: 
author: 
ms.author: 
ms.date: 
keywords: 
---
```

* Fill in the relevant metadata fields per the instructions in the section above.
* Write article content.
* Add a "See also" section at the bottom of the article with links to other relevant articles.
* When finished, commit changes to your branch.
* Create a pull request to merge your branch into master.

## Markdown basics
* [How to use Markdown for docs.microsoft.com](https://docs.microsoft.com/en-us/contribute/help-crr/help-content/contribute/contribute-how-to-write-use-markdown)
* For an at-a-glance guide to writing markdown, print this ["Markdown is for Everyone" Poster PDF](images/DocsMarkdownPoster.pdf)
* [Additional resources for writing Markdown](https://review.docs.microsoft.com/en-us/windows-authoring-guide/writing-guidance/writing-markdown?branch=master)

### Adding tables
Because of the way docs.microsoft.com styles tables, they won’t have borders or custom styles, even if you try inline CSS. It will appear to work for a short period of time, but eventually the platform will strip the styling out of the table. So plan ahead and keep your tables simple. [Here’s a site that makes Markdown tables easy.](http://www.tablesgenerator.com/markdown_tables)

### Adding images
You’ll need to upload your images to the images folder in the repo, and then reference them appropriately in the article. Images will automatically show up at full-size, which means if your image is large, it’ll fill the entire width of the article. Thus, we recommend pre-sizing your images before uploading them. The recommended width is between 600 and 700 pixels, though you should size up or down if it’s a dense screenshot or a fraction of a screenshot respectively. [You can find solid guidance here.](https://review.docs.microsoft.com/en-us/help/style/style-how-to-visuals-static-art-types?branch=master)

### Previewing your work
While editing in the browser, you can click the **Preview** tab near the top of the page to preview your work before committing. Once your contributions have been merged into the master branch, you can see what the documentation will look like when it goes public at https://review.docs.microsoft.com/en-us/windows/mixed-reality/install-the-tools?branch=master (find your article using the table of contents in the left column.

## Editing in the browser vs. editing with a desktop client

Editing in the browser is the easiest way to make quick changes, however, there are a couple disadvantages:
* You don't get spell-check.
* You don't get any smart-linking to other articles (you have to manually type the article's filename).

If you'd rather not deal with these issues, you may prefer to use a desktop client like [VS Code](https://code.visualstudio.com/) to contribute to documentation. We'll be adding instructions for using VS Code shortly.

