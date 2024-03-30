---
catagories:
  - Project
tags:
  - project
  - perservinginfo
  - overview
date: "2024-02-18"
type: "project"
layout: "list"
# meta: "false"
title: "Preserving Info"
---
Overall goal is to provide an build a framework for perserving information for future generations.

Starting as a [100 day project](https://www.the100dayproject.org/). 
- Start: Feb 18th, 2024
- End: May 28, 2024

## Standards

### Data Format

- Test: ASCII
- Images: JPEG

### Storage (data/metadata)

- Text: Git
- Images: Plain Objects, sorted by general date/topic in directories

### Backup

Broad concept is that backups are still readable if directly accessed, to the best of our abilities

- Rclone for most items.  Ensure that 
- Local Backups - External drive 
- Remote Object Store Backups
  - Amazon S3
  - Backblaze B2
  - Cloudflare R2

Document in main journal and bjournal all locations, and where credentials are located.