  ---
layout: page
title: "Monitor"
meta: "false"
tags: ["devops","ops"]
---

All things monitoring related.

## Cloud Native

My preferred stack:  Prometheus, Grafana, Loki
- [Node Exporter](https://github.com/prometheus/node_exporter): Prometheus exporter for server/OS statistics 
- [Elk Stack for Log Monitoring](https://www.elastic.co/webinars/elk-stack-devops-environment): ELK tends to be a bit heavy, but keeping this around just in case
- [Changd](https://github.com/paschmann/changd): Notify if WebUI changes.
- Performance related articles at <https://www.brendangregg.com>
- Internet Monitoring (globally)
  - [AWS CloudWatch Internet Weather Map](https://aws.amazon.com/blogs/aws/amazon-cloudwatch-internet-weather-map-view-and-analyze-internet-health/)
  - [Contrack talkes - one thousand and one flows](https://blog.cloudflare.com/conntrack-tales-one-thousand-and-one-flows/) - Interesting article on monitoring the maximum number of entries in the Linux Contrack table, used for statefile firewall setup
  - [Pingdom's State of the Internet](https://livemap.pingdom.com/)
  - [Down Detector](https://downdetector.com/)
  - [Oracle Internet Intelligence](https://map.internetintel.oracle.com/)
  - [The Outage Mailing List](https://puck.nether.net/pipermail/outages/) - Network admins chatting about global issues
- Internet Monitoring (locally)
  - [Open Speed Test](https://github.com/openspeedtest/Speed-Test): Browser based, no client login required.
  - [Trippy](https://trippy.cli.rs/): More advance Traceroute

## Alternative Software I want to Look At Someday

- [One Uptime](https://github.com/OneUptime/oneuptime): Open source observability platform - uptime monitoring, incident maganement, oncall alerts, logs, traces, etc (and **maybe** metrics, but not widely advertised)
- [OpenObserve](https://github.com/openobserve/openobserve): Open source, lightweight, single binary, drop in replacement for Elisticsearch, support OpenTelementry/OTEL
- [Signoz](https://signoz.io/): Open source, lightweight, log, metrics, traces, all working with OpenTelementry
- [BindplaneOP](https://observiq.com/solutions/bindplane-op/): Manage sources that are OpenTelementry Specific

## Advance Debugging

- strace - Almost always available.  Potentially A LOT of performance impact
- [Sysdig](https://github.com/draios/sysdig): Combo of strace and tcpdump - and with less performance impact
- [Sysdig Inspect](https://github.com/draios/sysdig-inspect): Potential GUI for sysdig output
- [eBPF.io](https://ebpf.io/): Resources for eBPF
- [KubeCTL Trace](https://github.com/iovisor/kubectl-trace): Easily run eBFP from kubectl
- [Pixie Labs](https://pixielabs.ai/): Troubleshoot K8S apps relatively easily, leveraging eBFP

## Data Visualization

- [Observable Framework](https://observablehq.com/framework/): Code based data visualization framekwork.

## Performance/Tuning

Purposely in the "monitor" phase of the DevOps cycle, as you do not want to prematurely optimize an architecture.

- [How Cloudflare Was Able to Support 55 Million Requests per Second With Only 15 Postgres Clusters](https://newsletter.systemdesign.one/p/postgresql-scalability)
- [Scaling Mastodon](https://hazelweakly.me/blog/scaling-mastodon/) - Also some great general tips for Rails, Sidekiq, and Redis.
- [Scaling Mastodon to 128K Users](https://gist.github.com/Gargron/aa9341a49dc91d5a721019d9e0c9fd11)

## Post-Mortum

Also see [plan](plan.md) for actual retrospective stores - as those are the basis for planning improvements

- [How to write Meaningful Retrospectives](https://www.blameless.com/incident-response/how-to-write-meaningful-retrospectives)

## Articles

- [Everyone Should Be On-Call](https://incident.io/blog/on-call-at-incident-io) - with appropriate life balance and compensation

## Sites

- [End Of Life](https://endoflife.date/): Quick End of Life Reference