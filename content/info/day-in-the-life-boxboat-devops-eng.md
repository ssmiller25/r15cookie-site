---
title: "A Day in the Life of a BoxBoat DevOps Engineer"
draft: false
tags: [
    "career"
]
meta: "false"
---

Retrieved on [3/30/2024 from the Wayback Machine](https://web.archive.org/web/20230206093145/https://boxboat.com/2021/03/11/day-in-the-life-boxboat-devops-engineer/)

by [Jimmy Ungerman](https://jimops.io/) | Thursday, Mar 11, 2021 | BoxBoat

Hello all! My name is Jimmy Ungerman and I’m next in our series of “Day in the Life” blogs here at BoxBoat. Now a days, DevOps seems to be the next big thing. Every company is hiring troves of DevOps Engineers to help them automate deployment jobs, setup and maintain infrastructure, or just be the go-to Kubernetes person. As one of the DevOps Engineers here at BoxBoat, I'll take you through a pretty typical day for me.

If you want to see what some of our other team members do on a daily basis, check out the other entries in our series: David the Director and Forester the Solutions Architect.

**5:45 am:** Wake up and contemplate the life choices that got me to move to Mountain time.

**5:46 am:** Caffeine. Lots of caffeine.

**6:00 am:** I'm definitely not a morning person, and that's okay. Now that the hardest part of my day is out of the way, it’s time to catch up on emails and messages in Mattermost/Slack that I may have missed from the night before. I currently am working in the federal space with people spread through multiple time zones so there is always something to catch up on.

I’m somewhat in-between project cycles right now since I was just on PTO for a week while moving, but this first week back has been great to catch up and learn about new projects at my customer.

**7:00 am:** More and more people are now online. This morning isn’t very meeting heavy, so I get the time to research and dive into my Federal customer’s new release.

This new release will stand up their full application stack on a Kubernetes cluster, pre-configured and ready go to via GitOps. Awesome! Of course there is a ton of documentation to read through. I realize that I'm going to spend the next hour or so reading documentation and deploying it locally to figure out the best way to contribute to it.

As a DevOps Engineer, documentation is your best friend. USE IT!

**8:45 am:** First Scrum Meeting of the day. This one is purely internal, and includes our BoxBoat team members. Time to figure out what everyone else has going on today and where I can learn/help out.

**9:15 am:** Second Scrum meeting. This one is with the customer. We are going over some work that another engineer and I did yesterday to setup an environment. This is actually my first government contract, and it's been a blast seeing all of the different environment types, Impact Levels, and classifications. My goal is to become a sponge and absorb as much knowledge as I can.

The Scrum meeting ends, so I go back to researching that new release.

**11:30 am:** Its time to go get some food. I usually have a quick lunch, and then hop back into work. I'm glad that I spent a bunch of time reading through the release documentation, because it actually automates a lot of the work we just discussed during the standup meeting.

Anything we can automate is a plus in my book.

**12:00 pm:** Time for our weekly demo. Part of our government contract includes performing a “weekly demo” or “workshop” for the customer to showcase new technologies or our work completed the week prior.

This week, my coworker Mikhail Swift is running a demo on reproducible builds. This is extremely important in the wake of the SolarWinds hack, and you can find even more info here.

**1:00 pm:** Time to prep for my next Meeting. I recently completed a project that includes refactoring BoxBoat's implementation of Hobby Farm. Hobby Farm is actually an open source learning platform developed by Rancher engineers. This platform makes it pretty easy to write hands-on, technical training content. My customer wanted to use this platform to onboard new employees. Now we are working on a v2.0 release and the features necessary to accelerate adoption in the federal space.

**2:00 pm:** HobbyFarm 2.0 meeting done! Lots of constructive feedback on how we can make this better. Looks like I get to dive back into this for the next couple of months. Honestly, whatever we can do to make them happy.

I’ll start now working out some sort of game plan for the features that I think are quick additions or even bug fixes vs major features that may take some time. Then the fun begins in starting to work on this. Most of this work is going to be infrastructure changes (my absolute favorite) so time to hunker down and try to figure out the best way to improve the architecture of this and make it pretty much air-gapped for the federal space.

Time to make a new branch and let’s start writing some infrastructure as code!

**2:01 pm:** Time to join our weekly BoxBoat Engineering meeting! I guarantee that someone will make a comment about my hair being crazy for yet another week. In all seriousness though, this is one of my favorite meetings every week. We all have the opportunity to hear what everyone else has been working on and where there are chances to learn new technologies, or just how another engineer may have tackled a problem a specific way that I never would have thought of.

**3:00 pm:** Waking up super early in the morning may not be my first choice, but it has its perks at the end of the day. Time to go walk the dog and maybe take a hike with my wife! I'm starting to like these early mornings, they turn into early afternoons.

Hope you’ve all learned a bit about what a standard Wednesday looks like for me in between project cycles!