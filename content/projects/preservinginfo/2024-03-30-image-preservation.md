---
date: "2024-03-30"
description: ""
tags: ["preservinginfo"]
title: "Image Preservation"
---
So good progress has been made [storing my recipes](https://github.com/ssmiller25/recipe).  Right now I have a collection of public resources (recipes, [this blog](https://r15cookie.com)) and private repositories (A bullet journal for daily tasks, a journal for adhoc writing).  But all of these only only encompass text, and in the case of the blog, smaller images I feel comfortable storing in git.  What do I do with larger image collections?

After some review of git-annex and git-lfs, I realize that I'd rather avoid placing the files in a system that would require external software to review.  My text is in git repositories, but git is not required to view the current "version" of software.  My process will probably be local files, organized by date, and synced with an object store in a few places (AWS S3 and B2 potentially...a few places).

With the holidays coming up I'll probably just do a few recipe conversions during the holidays.  I'm kind of imagine this growing into a replication service as well.  Even my ASCII text is only kept locally and in git on Github/Gitlab.  I should also ensure that copies of that data exist in several locations.