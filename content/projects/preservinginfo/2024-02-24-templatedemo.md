---
date: "2024-02-24"
description: ""
tags: ["preservinginfo"]
title: "Template Work"
---
While a bit of a distraction, I wanted to ensure my primary template had a good demonstration.  [CloudFlare's Pages](https://pages.cloudflare.com) seems perfect.  A generic static website hosting, and has built in support for Hugo.  But despite the confiugration made available in the GUI, I was unable to get the Cloudflare working to accept the custom parameters I needed to allow the [exampleSite](https://github.com/ssmiller25/r15-papercss-hugo-theme/tree/main/exampleSite) within the template to work.  

My new plan is to leverage a traditional Github Action workflow to build out the site, then manually upload the assets to Cloudflare.  I started work on the 
[PR for the workflow and Terraform](https://github.com/ssmiller25/r15-papercss-hugo-theme/pull/2).  The workflow hasn't been written.  The Makefile itself has all the build steps, so mostly it's wiring up the Cloudflare components.  The Terraform is more of a bonus to build out the complete infrastructure.  I'd love to think of the module as a way for others to quickly deploy this code.  But also aware that, even with Terraform, bootstraping is not a trivial tasks.  

I should wrap this up in the next day or two.  Then onword to probably a record of my recipes.