---
layout: page
title: "Plan"
meta: "false"
tags: ["dev", "devops", "postmortem"]
---

Planning for a DevOps Cycle

## Architecture

- [Platform Engineering](https://platformengineering.org/): Home for Platform Engineers.  Includes a comprehensive tech library of stacks/solutions.
  - [Backstage](https://backstage.io/): Open source developer portal 
  - [Krato](https://krateo.io/): Potentially lighter-weight solution to Backstage, but also seems heavily tied into ArgoCD and Crossplane
- [Keeping Code Simple](https://graphite.dev/blog/keeping-code-simple)
- [Questions for a new technology]()
- [Redhat Demo Central](https://gitlab.com/redhatdemocentral/portfolio-architecture-examples) - Architectures for a wide range of cloud infrastructures and problems.
- [Who Cares If It Scales](https://betterprogramming.pub/who-cares-if-it-scales-1946adca8167) - Avoiding pre-mature optimization.


## Statistics

- [Github Release Download Stats](https://www.markhneedham.com/blog/2018/03/23/github-release-download-count/): For public projects, perhaps useful to gauge how popular certain packages are - especially if one is NOT collecting telemetry data directly from users.

## Questions For A New Technology

[Source](https://kellanem.com/notes/new-tech)

1. What problem are we trying to solve? (Tech should never be introduced as an end to itself)
2. How could we solve the problem with our current tech stack? (If the answer is we can’t, then we probably haven’t thought about the problem deeply enough)
3. Are we clear on what new costs we are taking on with the new technology? (monitoring, training, cognitive load, etc)
4. What about our current stack makes solving this problem in a cost-effective manner (in terms of money, people or time) difficult?
5. If this new tech is a replacement for something we currently do, are we committed to moving everything to this new technology in the future? Or are we proliferating multiple solutions to the same problem? (aka “Will this solution kill and eat the solution that it replaces?”)
6. Who do we know and trust who uses this tech? Have we talked to them about it? What did they say about it? What don’t they like about it? (if they don’t hate it, they haven’t used it in depth yet)
7. What’s a low risk way to get started?
8. Have you gotten a mixed discipline group of senior folks together and thrashed out each of the above points? Where is that documented?

## Tech Debt

- [We invested 10% to pay back tech debt; Here's what happened](https://blog.alexewerlof.com/p/tech-debt-day)

## Post-Mortem

Post mortums are the basis of planning for future improvements.

### General

- [Kubernetes Fail Stories](https://k8s.af/) and [Source](https://github.com/hjacobs/kubernetes-failure-stories)
- [Danluu's Post Mortem Repo](https://github.com/danluu/post-mortems)
- [Scaling up Prive Video By Migration to a Monolith](https://www.primevideotech.com/video-streaming/scaling-up-the-prime-video-audio-video-monitoring-service-and-reducing-costs-by-90): A good case study that some workloads are better served by a Monolithic app.  Of course intersting that "monolith" in this case is an ECS container that processes an entire stream - perhaps describe better as a case-study in the downsides of extereme Microservice engineering for certain cases (large batch video processing for instance)

### 2024

- [Resend Outage](https://resend.com/blog/incident-report-for-february-21-2024): Developer performed local migraiton while pointed to production database, taking site down for about 12 hours.
- [Crowdstrike Falcon Content Update](https://www.crowdstrike.com/falcon-content-update-remediation-and-guidance-hub/) - The outage of the year (so far). Untested content pack update overflowed the number of parameters expected in an IPC check. Caused Windows systems to blue screen.
  - [Crowdstrike External Technical Root Cause Analysis (PDF)](https://www.crowdstrike.com/wp-content/uploads/2024/08/Channel-File-291-Incident-Root-Cause-Analysis-08.06.2024.pdf) - Nothing really too new. Root cause was a parameter overflow that was not properly tested in CI.
- [Stoli Ransomware Attach And Bankruptcy](https://therecord.media/stoli-group-usa-bankruptcy-filing-ransomware) and [raw bankruptcy filing](https://cases.stretto.com/public/x388/13367/PLEADINGS/1336711292480000000024.pdf). Took out ERP system until Q1 of 2025. A **huge** case of proactive security measures and DR practices.

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
