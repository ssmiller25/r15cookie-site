---
date: "2024-03-24"
description: ""
tags: ["preservinginfo"]
title: "Recipe Site Deployed"
---
With the template complete, I spent last night and tomorrow deploying the family recipe site [recipe.r15cookie.com](https://recipe.r15cookie.com/).  Deployed as a Github Pages project, it seems to work fairly well.  At one point I wanted to automated the deployment more, but given the work to coordinate between Github pages setup, the custom domain, and Cloudflare, in the end it was easy to do manually then to figure out how to coordinate between the three.  Although I had ideas that this would be deployable easily, in reality at long as it's something stored in Markdown, the details of how it's deployed are a bit inconsequential.

What's nice is now I have something easy I can do for off/busy days - move a recipe or two from Google Drive over to the recipe site.  When I'm feeling more ambitious, I can work on tweaking the recipe site or template to make items like the blog listing, and recipe format, a bit more streamlined.  I'd also like to add the ability to easily add recipes - weather I go all out and deploy a Decap front-end, or simply point individuals to the Github issue trackor and/or form, it will depend.  As I think about it, I'm feeling maybe a form pipeline, maybe auto-generate a PR, and then that could be quickly edited or approved.  Although also have to worry about preventing spambots from flooding my repo with PRs - so perhaps just issues - or perhaps some email queue or something of that nature.

In all cases, I'm hoping the flexibilty will help me make this project more of a daily habit.