---
title: "About"
description: "About Myself"
meta: "false"
toc: true
menu: main
---

This is the personal website of Steve Miller.  

[Github](https://www.github.com/ssmiller25) / [Gitlab](https://www.gitlab.com/ssmiller25) / [Mastodon](https://cloud-native.social/@ssmiller25) / [LinkedIn](https://www.linkedin.com/in/steve-miller-9936632) / [Email Form](/contact)

## Personal Summary

Steve Miller is a DevOps practitioner who enjoys creating robust architectures leveraging development and operational best practices. His nearly 20 years of experience cover a wide variety of platforms in the public and private sectors. His background covers a wide variety of cloud, virtualization, and enterprise datacenter technologies.

## Site Name Origin

The domain name is from a phrase that came while drifting asleep: "We need
to put a cookie on the R15 resistor"  

## Projects

- [Overall Projects](/projects)
- [Personal Tech Stack](/stack)

## Professional Publications

- [Introducing vROpsCLI from Blue Medora](https://bluemedora.com/introducing-vropscli-from-blue-medora/) - [Local Copy](/publications/intro-vropscli/)
- [SOC2 Compliance In A Code Driven Infrastructure](https://bluemedora.com/soc-2-compliance-in-a-code-driven-infrastructure-blue-medora/) - [Local Copy](/publications/soc2-code-driven-infrastructure/)

## Speaking Engagements

- [DevOps BootCamp 2021: People Over Process](https://www.youtube.com/watch?v=1oLuww9IfcI)
- [DevOps BootCamp 2021: Fast Feedback](https://www.youtube.com/watch?v=4zfKuDoXwQI) - [Presentation](https://present.r15cookie.com/civo-fastfeedback.md#/)
- [Automation test and tools for Civo marketplace apps](https://www.youtube.com/watch?v=6E5-ZaMROKs) - with [code repo](https://github.com/ssmiller25/civo-marketplace-template)
- [Grand Rapids Cyber Security Conference: Using Security Baselines](https://grandrapidscybersecuritycon2015.sched.com/event/4EZl/gordon-foods-using-security-baselines) ([Presentation](/assets/using-security-baselines.pdf))

Presentation Site: <https://present.r15cookie.com> - [Source](https://github.com/ssmiller25/present)


## Professional Experience

### Tuition.io - Sr. DevOps Engineer (Dec 2021 - Present)

Responsible for development and operation of production infrastructure and site reliability engineering at Tuition.io

- AWS
- Kubernetes
- Terraform
- Security and Compliance

### Plex Systems - Sr. Software Engineer (Dec 2019 - Dec 2021)

Responsible for development and operation of production infrastructure and site reliability engineering for Plex's SaaS offering.

- Developed major components of the internal hybrid-cloud containerization platform leveraging Kubernetes (Rancher) on both vSphere and Azure.   The platform is managed in a GitOps methodology leveraging FluxCD as well as Atlantis to manage Terraform.
- Assisted in the deployment an Istio ServiceMesh to help enable more advance Microservice features in application
architectures.
- Served as an internal advocate for the Kubernetes container platform, including documenting walkthroughs and technical documentation, presenting on the platform, and providing one on one assistance.
- Maintenance on on-prem and cloud Kubernetes infrastructure, including kubeadm based, Azure Kubernetes Service (AKS) and Rancher (RKE) based clusters
- Primary SRE Lead on a project to deploy VerneMQ in Kubernetes, to provide MQTT services for the Plex IIoT Platform.
- Lead a team to roll out Grafana within the internal platform, allowing a reduction of cost by migrating away from a SaaS deployed version.
- Cost savings by adjustment of metrics being sent to third party monitoring integrations

### Blue Medora - DevOps Engineer (Oct 2016 - Dec 2019)

Responsible for providing enterprise-level infrastructure and resources to the sales and engineering teams, both on-premise and remote.

- Primary DevOps Engineer on the SaaS application platform, Bindplane.  This involved management of a Kubernetes cluster in Amazon AWS, and a build pipeline leveraging TravisCI and Jenkins.  Migrated the SaaS application to Google Cloud platform, leveraging Terraform for infrastructure management.
- Developed a custom Python utility, [vROpsCLI](https://github.com/ssmiller25/vropscli), that leverages a REST API interface to enable larger customers an easier method to manage their environments.
- Built out an on-prem OS deployment system leveraging Foreman to deploy systems on a vCenter/ESXi cluster.  Included integrations to DNS, Active Directory, and Chef.  This system enabled rapid deployment of environments based on developer and project demands, leveraging both image and PXE based builds
- Built and supported the demo environments for use by sales and partners.  Later migrated to Amazon AWS in order to improve uptime and availability to our worldwide sales teams.
- Offered direct assistance to the Sales team for several larger deals.  This included enhancing documentation as well as providing custom-compiled utilities in order to diagnose and support more complex configurations, such as Kerberos against Active Directory within a Java application.
- Played a crucial role in achieving SOC2 compliance.  This included fully documenting the deployment pipeline, and ensuring all documented policies tied back to technical controls to ensure compliance.
- Directly supported developers and QA in the following technologies:
  - Amazon AWS, Google Cloud, Microsoft Azure
  - Cisco MDS, F5 BigIP, Palo Alto Firewall
  - Couchbase, Elasticsearch, Hadoop, Redis
  - Microsoft Technologies (AD, SCOM, SCVMM, HyperV, SQL)
  - Nagios

### Gordon Food Service - Security Engineer (May 2016 - Oct 2016)

Responsible for monitoring and adjusting security controls within Gordon Food
Service.  Perform risk assessments against various software solutions.
Perform security assessments against potential breach situations as necessary.

- Developed and leveraged a Vagrant based workflow to assist with upgrades and configuration testing.
- Developed a Python based CLI tool to generate tickets based on events observed from the security incident response system.
- Performed a migration and upgrade of the primary file integrity monitoring
system.
- Assisted with upgrading the security information and event management
system (SIEM), including the diagnosis of potential OS level bugs.
- Analyzed unusual traffic from a third party device, and provided
documentation and evidence that was used for vendor remediation.
- Hardened a bastion box by implementing common security controls and
two-factor authentication.

### Gordon Food Service - System Administrator (March 2008 - May 2016)

Responsible for the management of 170+ remote Linux servers, 20+
Linux/HPUX/AIX/Windows central servers, 700+ Windows workstations, and 700+ point of sale systems.

- Technical lead for the rollout of a new credit card authorization system. Engineered a redundant system that met disaster recovery targets. The system successfully passed an external PCI evaluation as well as an internal threat model review.
- Implemented a CFEngine configuration management system for PCI based system to assist in management and compliance.  Migrated that configuration management system to Puppet in order to leverage shared resources across the company.
- Developed a remote PXE network-based imaging system for Linux servers, Windows workstations, and 4690 POS systems. The new system removed the need for external media and allowed remote scheduling of imaging and recovery activities.  The imaging system was capable of automating the setup of HP's BMC technology, iLO.
*Performed forensic work on a Linux based appliance, as well as a Windows-based DVR. Provided written documentation used for later remediation and vendor negotiation processes.
- Migrated system administration scripts and configurations to subversion in order to improve development, as well as to support SOX and PCI compliance audits.
- Implemented a VMWare Cluster for the Marketplace division. Migrated a major application from HPUX to Linux running on top of vSphere.

### Ferris State University (Feb. 2005 - March 2008)

Responsible for the maintenance of Solaris, Linux, and HPUX servers at the institution, as well
as a variety of Windows 2000/2003 servers and scripts. Assisted with tuning and maintenance of
Java based server applications.

- Technical team lead for the implementation of a new primary e-Learning application, Blackboard Vista Enterprise, utilizing a BEA Weblogic clustered application tier.
- Installed and configured a active/passive DNS failover system for the primary web server.
- Implemented a new Clariion CX3-40 array, migrating production data from a Clariion CX500.
- Developed a scalability testing system for interactive web-based applications.
- Secondary support for the VMWare ESX environment.  Migrated the student email server to the VM environment, reducing cost and increasing availability.
- Provided customized Perl scripts within the Appworx environment, to add GPG and SFTP functionality to that suite.

### Baker College (Sept. 2002 - March 2008)

Taught a variety of Computer Science, Computer Information Systems, and Networking Courses.

- Received the Lighthouse Award for the creative use of blended instruction to run two classes simultaneously.
- Used a variety of hands-on techniques to increase knowledge and retention.  Enhanced Java instruction using Java-based software robots to demonstrate object-oriented principles.
- Classes taught:
  - **Unix Admin:**- Intro to Unix/Linux, Unix/Linux System Administration, Web Server Administration
  - **Development:**- Interactive Web Development, Perl Programming, Java Programming
  - **Architecture:**- Computer Architecture, Advanced Computer Architecture
  - **Security:**- Security+, Introduction to Cryptography

### Marion Public Schools (Aug. 2003 - Feb. 2005)

Responsible for the technology program, including all PC and Network maintenance, budget and grant writing, policy development and collaboration with other districts.

- Developed a dynamic scheduling system for under-performing students to leverage available open study period slots, saving 20 person-hours a week of manual scheduling effort.
- Installed and maintained an Exchange server used for administrative email and calendar services.  Used a Linux based SMTP frontend which provided security and email services for teachers, saving Exchange licensing costs across the district.

## Open Source Community Contributions

- Civo: [Kubernetes Marketplace](https://github.com/civo/kubernetes-marketplace)
  - Official Ambassador in the Kubernetes Slack Channel
  - Contributed several applications to Civo's Kubernetes Marketplace 
- Plex Systems: [Sinker](https://github.com/plexsystems/sinker)
  - A utility to synchronize container registries.   Includes the ability to scan Kubernetes manifests for container definitions.
- Blue Medora: [vROpsCLI](https://github.com/bluemedorapublic/vropscli)
  - Manage vRealize Operations from the command line or from within an automation platform
- Rancher: [k3os](https://github.com/rancher/k3os/)
  - An immutable OS for running k3s, a Kubernetes distribution.
- [Kubeserial](https://github.com/janekbaraniewski/kubeserial)
  - Kubernetes Operator to provision and deprovision resources based on hardware events.


## Volunteer/Organizations

### Civo - Ambassador (Oct 2020 - Present)

- Assist the Civo and Kubernetes community in technical issue and questions
- Led several webinars to present technologies and concepts to the community
- Develop applications for the [Civo Marketplace](https://github.com/civo/kubernetes-marketplace)

### Cornerstone Church (May 2014 - May 2016)

- Developed the back-end code to load data from SaaS data solution, through REST API, using C#.  Also developed REST
endpoints to query data that was used in custom front-end code.
- Assisted in maintenance of content on website.

### Michigan Amateur Hockey Association District 6 (Aug 2011 - May 2021)

- Webmaster for the primary MAHA website: https://www.mahadistrict6.org
- Implements Google Workspace (Gsuite) for Non-Profits, allowing personalized mail and other Google Apps to be used within the organization. 
- Deployed an online payment system for the District Tournaments

### Adray Hockey Association (July 2001 - July 2018)

- Rewrote web app, migrating from Coldfusion/Microsoft Access to PHP/MySQL.
- Implemented an MVC system to make PHP code more manageable and support more centralized security methods.
- Perform ongoing code and data administration.

## Skills

- **Operating Systems:** Linux (Redhat, Suse, Ubuntu, Debian, OEL), Windows Server 2008-2016, HP-UX, AIX, Solaris, Toshiba (IBM) 4690
- **Infrastructure As Code:** git, Terraform, Terragrunt, Packer, Vagrant
- **CI/CD Pipelines:** Azure DevOps, Github Actions, CircleCI, TravisCI
- **Monitoring:** Prometheus, Grafana, Loki, ELK (Elasticsearch, Logstash, and Kibana), Nagios, VMWare vRealize Operations
- **Virtualization/Containerization**: Kubernetes, Docker, Vmware vSphere/ESXi, LXC, KVM
- **Programming Languages:** Shell Scripting (Bash, KSH), GoLang, Python, Perl, PHP, Java, SQL
- **Applications:** Active Directory, Apache, Ansible, Chef, Git, MySQL, Nagios, Puppet, Tomcat
- **Cluster:** HP ServiceGuard, Veritas Cluster/File System
- **Network:** F5 Local Traffic Manager, OpenSSL, iptables, PXELinux, dhpcd, tftp, Squid Web Caching, Cacti, Wireshark/tcpdump, Nagios, Cisco IOS, Palo Alto Firewall
- **Storage/Backup:**  EMC Clariion, Netapp, Pure, Veritas Netbackup
- **Cloud:** Alibaba Cloud, Amazon AWS, Google Cloud, Microsoft Azure

## Training/Certifications

- [Azure Security Best Practices](/assets/about/azurckae-sec-certificate.pdf)


## Education

### BS In Computer Information Systems

- 3.76 Cumulative GPA
- Participated in the Honors Program
