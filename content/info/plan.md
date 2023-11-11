---
layout: page
title: "Plan"
meta: "false"
tags: ["dev", "devops", "postmortem"]
---

Planning for a DevOps Cycle

## Architecture

- [Platform Engineering](https://platformengineering.org/): Home for Platform Engineers.  Includes a comprehensive tech library of stacks/solutions.
- [Redhat Demo Central](https://gitlab.com/redhatdemocentral/portfolio-architecture-examples) - Architectures for a wide range of cloud infrastructures and problems.
- [Who Cares If It Scales](https://betterprogramming.pub/who-cares-if-it-scales-1946adca8167) - Avoiding pre-mature optimization.

## Statistics

- [Github Release Download Stats](https://www.markhneedham.com/blog/2018/03/23/github-release-download-count/): For public projects, perhaps useful to gauge how popular certain packages are - espcially if one is NOT collecting telemetry data directly from users.

## Tech Debt

- [We invested 10% to pay back tech debt; Here's what happened](https://blog.alexewerlof.com/p/tech-debt-day)

## Post-Mortem

Post mortums are the basis of planning for future improvements.

### General

- [Kubernetes Fail Stories](https://k8s.af/) and [Source](https://github.com/hjacobs/kubernetes-failure-stories)
- [Danluu's Post Mortem Repo](https://github.com/danluu/post-mortems)
- [Scaling up Prive Video By Migration to a Monolith](https://www.primevideotech.com/video-streaming/scaling-up-the-prime-video-audio-video-monitoring-service-and-reducing-costs-by-90): A good case study that some workloads are better served by a Monolithic app.  Of course intersting that "monolith" in this case is an ECS container that processes an entire stream - perhaps describe better as a case-study in the downsides of extereme Microservice engineering for certain cases (large batch video processing for instance)

### 2023

- [CircleCI Security Breach](https://circleci.com/blog/jan-4-2023-incident-report/)
- [NameCheap Spam Email](https://www.namecheap.com/status-updates/archives/74848)
  - [Details based on spam I received](/info/post-mortem-namecheap) - third party provider most likely Sendgrid
- [Okta Security Compromise](https://sec.okta.com/harfiles): Beleved to be a combination of session compromise via saved HAR files, and an employee saving their work credentials to personal Google account that was compromised.
- [Reddit Pi Day Outage](https://www.reddit.com/r/RedditEng/comments/11xx5o0/you_broke_reddit_the_piday_outage/) - Great overview of a Kubernetes outage centered around an upgrade from 1.23 to 1.24
- [Reddit Thread: Wiedest Outages](https://www.reddit.com/r/ExperiencedDevs/comments/16cjdez/weirdest_outages_youve_had_to_experience_and_how/)
- [Square Incident Summary: 2023-09-07](https://developer.squareup.com/blog/incident-summary-2023-09-07/)

### 2022

- [Incident.IO - Intermittent Downtime](https://incident.io/blog/intermittent-downtime): Discussion of analysis and resolution in a Heroku app
- [Gitpod - Sustained Workspace Performance Degradation](https://www.gitpod.io/blog/sustained-performance-degradation)
- [How A Single Developer Dropped AWS Costs by 90% Then Disappeared](https://bootcamp.uxdesign.cc/how-a-single-developer-dropped-aws-costs-by-90-then-disappeared-2b46a115103a) - Good story/retrospective about why you whould always have software peer reviewed.
- [Lastpass Security Breach](https://blog.lastpass.com/2022/12/notice-of-recent-security-incident/)
  - [Root Cause: APT against Sr. DevOps Engineer Though Plex Media Player](https://arstechnica.com/information-technology/2023/02/lastpass-hackers-infected-employees-home-computer-and-stole-corporate-vault/)
  - [Why Not to Use Lastpass, and use 1Password and Bitwarden Instead](https://infosec.exchange/@epixoip/109585049354200263)

### 2020

- [Amazon Kinesis Aug 25 2020](https://aws.amazon.com/message/11201/)

### 2019 

- [Matrix Apr 2019](https://matrix.org/blog/2019/05/08/post-mortem-and-remediations-for-apr-11-security-incident)
- [Google Cloud June 2019](https://status.cloud.google.com/incident/cloud-networking/19009)

### 2017

- [Monzo Payment Outage](https://community.monzo.com/t/resolved-current-account-payments-may-fail-major-outage-27-10-2017/26296/95)
- [First Kubernetes Outage - Helm Related](https://engineering.saltside.se/our-first-kubernetes-outage-c6b9249cfd3a)

## Small Environment/Home Lab

Small Environment/Home Lab Planning resources

- [k8s-at-home](https://k8s-at-home.com/)
- [k8s-at-home Search](https://whazor.github.io/k8s-at-home-search) - Search FluxCD based HelmReleases of software
