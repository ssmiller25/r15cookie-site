---
layout: page
title: "Development/Architecture"
meta: "false"
tags: [
    "dev"
]
---

## Architecture/Engineering

- [The Platform Engineer](https://engineering.razorpay.com/the-platform-engineer-db2b21434911)
- Example Applications
  - [Open Telemetry Demo](https://github.com/open-telemetry/opentelemetry-demo): A modification of Google's Online Boutique, but with more integrations with Open Telementry
  - [RealWorld](https://github.com/gothinkster/realworld) - The ultimate demo app, with multiple frontend and backend frameworks
  - [Google's Online Boutique](https://github.com/GoogleCloudPlatform/microservices-demo) - True Microservice e-commerce app, written as a pologot style service covering most modern development languages today (Node, Go, Python, C#, Java)
  - [Google's Bank of Anthos](https://github.com/GoogleCloudPlatform/bank-of-anthos) - A lighter microservice example app - only Python and Java.  Both referencing PostgreSQL databases for persistence.
  - [WeaveWorks' Sock Shop](https://microservices-demo.github.io/) - Another example Microservice app.  Leverages Spring Boot, Go, and Node.js.  Also leverages RabbitMQ.

## Cloud Development Environment

- [Codespaces](https://github.com/features/codespaces): Github hosted cloud development
- [Coder](https://coder.com/)
  - [Coder versus Codespaces (and why self-hosted cloud env)](https://coder.com/blog/github-codespaces-coder-and-enterprise-customers)
- [GitPod](https://gitpod.io/)
- [DevPod](https://devpod.sh/) - Local tool that will spin up enviornments, based on [DevContainers](https://containers.dev/)


## Development

- No-Code
  - [APITable](https://github.com/apitable/apitable)
  - [NoCode List](https://nocodelist.co/)
  - [Budibase](https://www.budibase.com/)
  - [Cortez Project](https://cortezaproject.org/) - Golang based No-code Platform
  - [OpenBlocks](https://github.com/openblocks-dev/openblocks) - Open Source Retool Clone
  - [Pocketbase](https://pocketbase.io/): Realtime DB + Auth + Objectstore
  - [SaltCorn](https://saltcorn.com/)
  - [Taipy](https://www.taipy.io/): Python full-stack
- [Development - AI](/fino/ai)
- [Development - Go](/info/golang)
- [Development - Javascript](/info/javascript)
- [Development - Python](/info/python)
- [Development - Scripting](/info/scripting)
- [Development - Web](/info/webdev)

## Development Workflow

- [GitOps Best Practices](https://www.permit.io/blog/gitops-today-why-and-how): Slightly heavy on the policy-as-code front (not surprising given the source), but otherwise some really good best practices.
- [How atomic Git commits dramatically increased my productivity - and will increase yours too](https://dev.to/samuelfaure/how-atomic-git-commits-dramatically-increased-my-productivity-and-will-increase-yours-too-4a84)
- [Reverse Pull Request](https://dzone.com/articles/reverse-pull-requests): A way to review code in rapid-release cycles.

## Docker

- [Containers.dev](https://containers.dev/): Opening up the VSCode devcontainer.json for standardization
- [Docker Anti-Patterns](https://codefresh.io/containers/docker-anti-patterns/)
- [GUI Apps In Docker](https://www.trickster.dev/post/running-gui-apps-within-docker-containers/)
- [Using Docker for All Development](https://www.smashingmagazine.com/2022/07/using-nothing-but-docker-projects/)

## Security

- [Reproductable Builds](https://reproducible-builds.org/)

## Tools

- [Git](https://git-scm.com/):  All configurations should be in a version management system, and git is probably the best available.  For any open source code [Github](https://github.com/) is pretty much the defacto host for a lot of projects.
- [JQPlay](https://jqplay.org/): Quick way to debug jq filters.  [Also available as a Docker image](https://github.com/munntjlx/jqplay)
- Makefile: Explained in [Makefiles for Modern Development](https://dzone.com/articles/makefiles-for-modern-development)
- [Fossil SCM](https://www.fossil-scm.org/home/doc/trunk/www/index.wiki) - Distributed source control with wiki, issues, etc.


## Docker/Kubernetes Build Tools

- [DevSpaces](https://www.devspace.sh/): Another tool for rapid rebuild/deploy/live environments
- [Garden.io](https://garden.io/): Another tool for rapid rebuild/live build environments, with additional focus on CI/CD (versus Tilt)
- [Tilt](https://tilt.dev/): Tool for rapid rebuild/live build environments.



## Articles/Books

- [A Dev's Thoughts On Developer Productivity](https://about.sourcegraph.com/blog/developer-productivity-thoughts): A great discussion on optimizing the "inner" developer loop.
- [Advance Git](https://dev.to/g_abud/advanced-git-reference-1o9j): Advance git techniques and shortcuts
- [Art of Unix Programming](http://www.faqs.org/docs/artu/)
- [ChgLog](https://github.com/goreleaser/chglog) implementing [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#summary)
- [GitHub Flow](https://guides.github.com/introduction/flow/): A pretty standard process for committing to many open-source projects.
- [Uncurled](https://un.curl.dev/) ([Source](https://github.com/bagder/uncurled)): From the author of curl,  "everything I know and learned about running and maintaining Open Source projects for three decades."
- [The Command Line in 2004](http://garote.bdmonkeys.net/commandline/index.html)
- [The End of Localhost](https://www.swyx.io/the-end-of-localhost/): Proposal for development in the cloud
- [yagni - You Aren't Gonna Need It](https://martinfowler.com/bliki/Yagni.html): Could also easily apply to IaC code-bases

## Future Research

[Zeitgitter](https://github.com/zeitgitter/zeitgitterd): A timestamping service for git commits.  Interesting idea of using a git repo/chain as a form of "blockchain" with cryptographically ensured timestamps committed...