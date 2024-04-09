---
layout: page
title: "Security"
meta: "false"
tags: [
    "sec"
]
---


## Authentication

- Authentication Systems
  - [KeyCloak](https://www.keycloak.org/)
  - [Authentik](https://goauthentik.io/)
  - [Kanidm](https://kanidm.com/): Both Web and Linux PAM
  - [Netlify Identity](https://www.netlify.com/docs/identity/): Netlify's Authentication...basically a hosted version of their Open-source GoTrue library.
  - [GoTrue](https://github.com/netlify/gotrue): Open soruce JWT authentication backend)
  - [SuperTokens](https://github.com/supertokens/supertokens-core): Open source authentication solution, similar to Auth0
- [Securing Git with SSH and FIDO security keys](https://developers.yubico.com/SSH/Securing_git_with_SSH_and_FIDO2.html)

## Automated Code/Infra Scanning

Toward the top, as automated scanning of code and infrastructure is the first line of defense against security compromise.

- [Semgrep](https://semgrep.dev/): Static Analysis at ludicrous speed.  
  - Includes [Docker](https://semgrep.dev/p/dockerfile) and [Kubernetes](https://semgrep.dev/p/kubernetes) analysis
- [tfsec](https://github.com/aquasecurity/tfsec): Terraform Security Scanner

## Infrastructure Scanning

- [GovReady Github](https://github.com/GovReady): An entire Government sponsored site that integrates open source tools into government standards.  Policies for CentOS and Ubuntu exist, as well as a lot of other resources.
- [OpenSCAP](http://www.open-scap.org/page/Main_Page): Open source tool to read and evaluate system security based on SCAP standards
- [Lynis](https://cisofy.com/lynis/):  Another security scanner for Linux/Unix systems, focusing around common standards and best practices.  Seems far easier to install and configure than OpenSCAP.

## General Info

- [Free CyberSecurity Services and Tools - CISA](https://www.cisa.gov/free-cybersecurity-services-and-tools)
- Configuration Standards
  - [Center for Internet Security](http://www.cisecurity.org/): Provides configuration guides for common OS and server software.
  - [Linux Foundation Workstation Guidelines](https://github.com/lfit/itpol/blob/master/linux-workstation-security.md): Excellent overview for securely configuring a Linux workstation
- [Endian](http://www.endian.com): Appliance for security and hotspot management
- [HAR Cleaner](https://blog.cloudflare.com/introducing-har-sanitizer-secure-har-sharing/): Clean HARs.  Root cause of the [Okta Compromise](https://sec.okta.com/harfiles)
- [IPFire](http://www.ipfire.org/): Linux based firewall distro
- [Mailu](https://mailu.io/): Docker based e-mail system.  If I were to deploy a mail system today, this would be the basis.  Granted, I feel that there is limited justification for hosting one's own mail system.
- [Office IANA IP Block List](https://github.com/HotCakeX/Official-IANA-IP-blocks) - Compiles official IANA list of variosu countries.  Interesting enough, using Powershell to compile.
- [Odessa](http://odessa.sourceforge.net/): Alternative to Autopsy/Sleuth Kit for Open Source forensics work.
- [OPNSense](https://opnsense.org/):  OpenBSD based firewall.  Prefer it architecturally to pfSense
- [Snort](https://www.snort.org/): Open source intrusion detection system.

## Randomness

- [League of Entropy](https://www.cloudflare.com/leagueofentropy/) and [drand](https://github.com/drand/drand): A distributed, crytographically verifiby source of entropy.

## Secrets Management

- [Github-to-SOPS](https://github.com/tarasglek/github-to-sops): Interesting method using SOPS and Github user SSH keys, and AGE to build a light-weight secrets management platform
- [Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets): My goto for secrets management in k8s with no cloud dependencies.
- [External Secrets Operator](https://external-secrets.io/latest/): My goto for cloud-provided secrets management

## SSL/TLS Information

- [Let's Encrypt](https://letsencrypt.org/):  Freely available certificates for websites.
Requires a client as the certficates are only valid for 90 days, but many clients
exist.  I currently use [EFF Certbot](https://certbot.eff.org/)
- [Zero SSL](https://zerossl.com/#crt):  Method to obtain Let's Encrypt Certificates without installation. *WARNING:- If 
using their website tools, you are completely trusting this site.  Do not do this for any site in which sensitive information
will be transmitted!  Although honestly, those type of sites should probably purchase an EV certification.
  - Also supports 1 year certificates, and ACME protocol integration.  I nice alternative SSL provider if needed
- [Step-CA](https://smallstep.com/docs/step-ca) - Automated on-prem solution.  Needs additional research - and more inclinded to just leverage SSL Private CA below.

## OpenSSl Usage and CA 

See [OpenSSL Cheatsheet](/info/openssl-cheatsheet)


## Reading

- [Lessons From Reviewing Postmortems](http://danluu.com/postmortem-lessons/)
- [The Problem with PGP](https://latacora.micro.blog/2019/07/16/the-pgp-problem.html)