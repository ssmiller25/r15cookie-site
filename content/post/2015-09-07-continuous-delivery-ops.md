---
date: "2015-09-07T00:00:00Z"
description: ""
tags: []
title: Continuous Delivery In Ops
---

Continuous integration, continuous delivery,  and test driven development are pretty common on the development side of the house. In many
organizations, however, operations still has too many instances of building and maintaining systems by hand.  The
article [Why We Should Continuously Break Everything](https://web.archive.org/web/20170704142708/http%253A//blog.ingineering.it/post/128343918584/why-we-should-continuously-break-everything) (Internet Archive) is a great summary why continuous delivery helps make change less risky and combat
code and system configuration rot.  

## Original Article

Why We Should Continuously Break Everything
© 2015 Jeff Sussna, Ingineering.IT

Few things in IT are more painful or nerve-wracking than porting or refactoring a long-lived system. It could involve something as simple as moving an application to new hardware, or as complex as refactoring the application’s software architecture, or the architecture of the network beneath it. Exposing rot is an inevitable part of the process. “Oh yeah, we forgot to port the cron jobs we set up and forgot about six years ago.” “Oh yeah, the network was set up that way because of this one weird connection between those two weird processes.”

Continuous delivery teaches us that small, frequent changes are easier to manage, test, and fix than large, infrequent ones. In the words of Jez Humble, “…continuous delivery becomes even more important when you’re risk averse. Big-bang releases are horribly risky.” Continuous change may seem to cause continuous failure; counterintuitively, though, it actually reduces the overall cost of failure.

Systems rot over time, even when they sit unchanged. Rot can arise due to human forgetfulness, or due to drift between a past decision and that decision’s appropriateness for current conditions. Exposing rot is no different than doing integration testing. The more you try to do at once, the more complex it is to understand and repair the problems you find.

The need for the ability to deliver change is accelerating on all levels. New business needs and technical solutions are both arising ever more quickly. Yesterday it was cloud and VM’s. Today it’s cloud-native and containers. Tomorrow it will be…who knows?

The expectations for IT’s ability to port and refactor its systems is similarly rising. We can no longer look away from our fear by putting it off. Instead, we need to consider applying the principles of continuous delivery to system change altogether. The thought of building in pervasive refactoring, at all levels of the IT stack, may seem like a radical, even foolhardy, proposal. It certainly will cause more continuous failure, as we expose rot more continuously. Just as with continuous delivery, though, it will contribute to less overall failure, less cost due to that failure, and more robust systems. Most importantly, it will do so while increasing our ability to deliver change. That ability is, after all, the prime imperative of 21st-century business.

