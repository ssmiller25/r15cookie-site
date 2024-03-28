---
layout: page
title: "Package"
meta: "false"
tags: [
    "dev"
]
---
Topics related to packaging of software to prepare for deployment.  Also general collecdtion of CI/CD pipeline info

## Infrastructure as Code

- [Digger](https://digger.dev/): Run Terraform from native CI/CD runners (think Atlantis, without the runtime requirements)

## Github Actions

- [Running a new workflow dispatch from a PR](https://stackoverflow.com/questions/63362126/github-actions-how-to-run-a-workflow-created-on-a-non-master-branch-from-the-wo)
- [GitHub Actions Dynamic Matrix](https://developer-friendly.blog/2024/03/09/github-actions-dynamic-matrix/): Methodology to define a dynamic matric in Github Actions

## Container Package Builds

- [Zarf](https://github.com/defenseunicorns/zarf): Primarily for airgap or limited k8s environemnts.  Also has nice support for SBOM and cosign.