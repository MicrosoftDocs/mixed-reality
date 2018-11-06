# Contributing to Windows Mixed Reality developer documentation

Welcome to the [public repo for Windows Mixed Reality developer documentation](https://github.com/MicrosoftDocs/mixed-reality/tree/master/mixed-reality-docs)! Any articles you create or edit in this repo **will be visible to the public.** Windows Mixed Reality docs are now on the docs.microsoft.com platform, which uses GitHub-flavored Markdown (with Markdig features). This page covers the basic steps and guidelines for contributing, as well as links to Markdown basics. Thank you for your contribution!

## Before you start

If you don't already have one, you'll need to [create a GitHub account](https://github.com/join).

>[!NOTE]
>If you're a Microsoft employee, link your GitHub account to your Microsoft alias on the [Microsoft Open Source portal](https://repos.opensource.microsoft.com/). Join the **"Microsoft"** and **"MicrosoftDocs"** organizations).

When setting up your GitHub account, we also recommend these security precautions:
- Create a [strong password for your Github account](https://github.com/settings/admin).
- Enable [two-factor authentication](https://github.com/settings/two_factor_authentication/configure).
- Save your [recovery codes](https://github.com/settings/auth/recovery-codes) in a safe place.
- Update your [public profile settings](https://github.com/settings/profile).
   - Set your name, and consider setting your *Public email* to *Don't show my email address*.
   - We recommend you upload a profile picture, as a thumbnail will be shown on docs pages to which you contribute.
- If you plan to use a command line workflow, consider setting up [Git Credential Manager for Windows](https://github.com/Microsoft/Git-Credential-Manager-for-Windows/releases/latest) so that you don't have to enter your password each time you make a contribution.

Taking these steps is important as the publishing system is tied to GitHub and you'll be listed as either author or contributor to each article using your GitHub alias.

## Editing an existing article

Use the following workflow to make updates to the documentation via web browser:

1. Navigate to the article you wish to edit.
2. Click the edit button (pencil icon) in the top right. This will automatically fork a disposable branch off master.

   ![Edit an article.](images/editpage.png)
3. Edit the content of the article (see ["Markdown basics"](#markdown-basics) below for guidance).
4. Update metadata as relevant at the top of each article:
   * title: This is the page title that appears in the browser tab when the article is being viewed. As this is used for SEO and indexing, you shouldn't change the title unless necessary (though this is less critical before documentation goes public).
   * description: Write a brief description of the article's content. This aids in SEO and discovery.
   * author: If you are the primary owner of the page, add your GitHub alias here.
   * ms.author: If you are the primary owner of the page, add your Microsoft alias here (you don't need @microsoft.com, just the alias).
   * ms.date: Update the date if you're adding major content to the page, but not for fixes like clarification, formatting, grammar, or spelling.
   * keywords: Keywords aid in SEO. Add keywords, separated by a comma and a space, that are specific to your article (but no punctuation after the last keyword in your list); you don't need to add global keywords that apply to all articles as those are managed elsewhere. 
5. When finished with your page edits, scroll down and click the **Propose file change** button.
6. On the next page, click **Create pull request** to merge your automatically-created branch into master.
7. After the pull request is completed, the site admin will delete your branch (this is easiest, so you don't have to keep it in sync with master).
8. Repeat the steps above for the next article you want to edit.

## Creating a new article

Use the following workflow to create new articles in the documentation via web browser:

1. Create a fork off the MicrosoftDocs/mixed-reality 'master' branch (using the **Fork** button in the top right).

   ![Fork the master branch.](images/forkbranch.png)
2. In the **mixed-reality-docs** folder, click the **Create new file** button in the top right.
3. Create a page name for the article (use hyphens instead of spaces and don't use punctuation or apostrophes) and append ".md"

   ![Name your new page.](images/newpagetitle.PNG)
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

5. Fill in the relevant metadata fields per the instructions in the [section above](#editing-an-existing-article).
6. Write article content using [Markdown basics](#markdown-basics).
7. Add a `## See also` section at the bottom of the article with links to other relevant articles.
8. When finished, click **Commit new file**.
9. Click **New pull request** and merge your fork's 'master' branch into MicrosoftDocs/mixed-reality 'master' (make sure the arrow is pointing the correct way).

   ![Create pull request from your fork into MicrosoftDocs/mixed-reality](images/pr_to_master.PNG)

## Markdown basics

The following resources will help you learn how to edit documentation using the Markdown language:

- [Markdown basics](https://help.github.com/articles/basic-writing-and-formatting-syntax/)
- [Markdown-at-a-glance reference poster](images/MarkdownPoster.pdf)
- [Additional resources for writing Markdown for docs.microsoft.com](https://review.docs.microsoft.com/en-us/help/contribute/contribute-how-to-write-use-markdown?branch=master)
- [Unique Markdig differences](https://review.docs.microsoft.com/en-us/new-hope/engineering/tools/markdig/markdig-migration-information?branch=master&tabs=dfm) and [Markdig multi-column support](https://review.docs.microsoft.com/en-us/curtcu-test/row-and-column?view=contososerver-2.1&branch=master)

### Adding tables

Because of the way docs.microsoft.com styles tables, they won’t have borders or custom styles, even if you try inline CSS. It will appear to work for a short period of time, but eventually the platform will strip the styling out of the table. So plan ahead and keep your tables simple. [Here’s a site that makes Markdown tables easy](http://www.tablesgenerator.com/markdown_tables).

The [Docs Markdown Extension for Visual Studio Code](https://docs.microsoft.com/teamblog/docs-extension) also makes table generation easy if you're using [Visual Studio Code](#using-visual-studio-code) to edit the documentation.

### Adding images

You’ll need to upload your images to the images folder in the repo, and then reference them appropriately in the article. Images will automatically show up at full-size, which means if your image is large, it’ll fill the entire width of the article. Thus, we recommend pre-sizing your images before uploading them. The recommended width is between 600 and 700 pixels, though you should size up or down if it’s a dense screenshot or a fraction of a screenshot, respectively. [You can find solid guidance here.](https://review.docs.microsoft.com/en-us/help/style/style-how-to-visuals-static-art-types?branch=master)

>[!IMPORTANT]
>You can only upload images to your forked repo. So, if you plan on adding images to an article, you'll need to [use Visual Studio Code](#using-visual-studio-code) or make sure you've done the following in a web browser:
>
>1. Forked the MicrosoftDocs/mixed-reality repo.
>2. Edited the article in your fork.
>3. Uploaded the images you're referencing in your article to the "images" folder in your fork.
>4. Created a **pull request** to merge your fork into the MicrosoftDocs/mixed-reality 'master' branch.
>
>To learn how to set up your own forked repo, follow the instructions for [creating a new article](#creating-a-new-article).

## Previewing your work

While editing in the browser, you can click the **Preview** tab near the top of the page to preview your work before committing. 

>[!NOTE]
>Previewing your changes on review.docs.microsoft.com is only available to Microsoft employees

Once your contributions have been merged into the 'master' branch, you can see what the documentation will look like when it goes public at https://review.docs.microsoft.com/en-us/windows/mixed-reality/install-the-tools?branch=master (find your article using the table of contents in the left column.

## Editing in the browser vs. editing with a desktop client

Editing in the browser is the easiest way to make quick changes, however, there are a few disadvantages:

- You don't get spell-check.
- You don't get any smart-linking to other articles (you have to manually type the article's filename).
- It can be a hassle to upload and reference images.

If you'd rather not deal with these issues, you may prefer to use a desktop client like [Visual Studio Code](https://code.visualstudio.com/) with a couple [helpful extensions](#useful-extensions) to contribute to documentation.

## Using Visual Studio Code

For the reasons listed [above](#editing-in-the-browser-vs-editing-with-a-desktop-client), you may prefer using a desktop client to edit documentation instead of a web browser. We recommend using [Visual Studio Code](https://code.visualstudio.com/).

### Setup

1. In a web browser:
    1. Install [Git for your PC](https://git-scm.com/downloads).
    2. Install [Visual Studio Code](https://code.visualstudio.com/).
    3. [Fork MicrosoftDocs/mixed-reality](#creating-a-new-article) if you haven't already.
    4. In your fork, click **Clone or download** and copy the URL.
2. Create a local clone of your fork in Visual Studio Code:
    1. From the **View** menu, select **Command Palette**.
    2. Type "Git:Clone."
    3. Paste the URL you just copied.
    4. Choose where to save the clone on your PC.
    5. Click **Open repo** in the pop-up.

### Editing documentation

Use the following workflow to make changes to the documentation with Visual Studio Code:

>[!NOTE]
>All the guidance for [editing](#editing-an-existing-article) and [creating](#creating-a-new-article) articles, and the [basics of editing Markdown](#markdown-basics), from above applies when using Visual Studio Code as well.

1. Make sure your cloned fork is up-to-date with the official repo.
   1. In a web browser, create a pull request to sync recent changes from other contributors in MicrosoftDocs/mixed-reality 'master' to your fork (make sure the arrow is pointing the right way).
      
      ![Sync changes from MicrosoftDocs/mixed-reality to your fork](images/sync_repos.PNG)
   2. In Visual Studio Code, click the sync button to sync your freshly updated fork to the local clone.
      
      ![Click the sync button](images/sync_clone.png)
2. Create or edit articles in your cloned repo using Visual Studio Code.
   1. Edit one or more articles (add images to “images” folder if necessary).
   2. **Save** changes in **Explorer**.
      
      ![Choose "Save all" in Explorer](images/explorer_save.png)
   3. **Commit all** changes in **Source Control** (write commit message when prompted).
      
      ![Choose "Commit all" in Source Control](images/source_control_commit.png)
   4. Click the **sync** button to sync your changes back to origin (your fork on GitHub).
      
      ![Click the sync button](images/sync_back.png)
3. In a web browser, create a pull request to sync new changes in your fork back to MicrosoftDocs/mixed-reality 'master' (make sure the arrow is pointing the correct way).

   ![Create pull request from your fork into MicrosoftDocs/mixed-reality](images/pr_to_master.PNG)

### Useful extensions

The following Visual Studio Code extensions are very useful when editing documentation:

- [Docs Markdown Extension for Visual Studio Code](https://docs.microsoft.com/teamblog/docs-extension) - Use **Alt+M** to bring up a menu of docs authoring options like:
   - Search and reference images you've uploaded.
   - Add formatting like lists, tables, and docs-specific call-outs like `>[!NOTE]`.
   - Search and reference internal links and bookmarks (links to specific sections within a page).
   - Formatting errors are highlighted (hover your mouse over the error to learn more).
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) - misspelled words will be underlined; right-click on a misspelled word to change it or save it to the dictionary.
