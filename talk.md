---
title: NIDC 2022 - Giving your colleagues superpowers with autonomy and automation
author: Peter McConnell (github.com/peter-mcconnell)
patat:
  theme:
    emph: [vividYellow, italic]
    header: [rgb#B2FF66]
...

# A brief introduction

- Peter McConnell
- SWE / SRE for ~20 years
- Eng. Mgr / Tech Lead. DevEx & SRE teams @ [Firebolt.io](https://firebolt.io)

- I like it when I can help people do their jobs
- I don't like to see people slowed down due to nonsense

- Here to talk to you today about automation
- The slides are more for me than they are for you :)

- _Slides available at [github.com/peter-mcconnell/talk-automation](https://github.com/peter-mcconnell/talk-automation)_


---

# Pitch

I'm fascinated by the power that automation brings and I love the impact is has on people and businesses ... and **I think you should be passionate about it too**.

This talk is based on real impact that I see from these tools on a daily basis in my day job. I know it works. I know it saves time and money. I know it makes people happy.

## .. but before we get started, lets agree on some terms

Automation - "The **automatic operation** or control of equipment, a process, or a system."

Autonomy - "The condition or quality of being autonomous; **independence**."


---

# What is the problem we're trying to solve?


_".. hey team, I need someone to create an S3 bucket for me ..."_
_"... the thingymajig service needs bounced on that server .."_
_".. can someone spin me up a cluster for testing? ..."_
_".. we need breakglass access to prod DB ..."_

## Lets quantify a hypothetical

small 100-person company
requestors: 4x requests a day; avg. 1 hour delay per request
implementors: 4x requests a day; avg. 30 mins per request

**6 hours per day / 126 hours per month wasted**

**+ cost of context switching**
**+ cost of human errors**
**+ cost of MTTR increase**
**+ ~ cost compounds as business scales**


---

# How can we improve things?

- A "devops" team (is that what "devops" is?)

    - Everyone -> :(

- Open access to everyone

    - CISO -> :(

- Runbook documents

    - Does it help much?

- Scripts and servers with managed access, auditing, scheduling etc

    - Sounds like a lot of work!

        - *Spoiler, not really*


---

# Rundeck

- Off-the-shelf and easy to run

- Designed specifically for automating runbooks and incident response

- Open-source (Apache 2.0) and enterprise option (we'll focus on open-source here)

- Support pre-auth

- Web UI, API and CLI

- Auditing

- ACLs

- Bought by PagerDuty


---

# Lets run it!

```yaml
# option 1. single container (in-memory H2 db)
docker run --rm -p 4440:4440 -t rundeck/rundeck:4.7.0

# option 2. docker-compose with postgres
---
version: "3.1"
services:
  rundeck:
    image: "rundeck/rundeck:4.7.0"
    depends_on:
      - "postgres"
    ports:
      - "4440:4440"
    ...
  postgres:
    image: "postgres:15.0"
    ...

# option 3. helm / kubernetes (out of scope)
# option 4. install on a VM (out of scope)
```


---

# Some tips

- Work with the CISO as early as possible

- Make your scripts robust

- Record the metrics and be loud about the wins


---

# That's all!

Now you know how to be an automation force - go make people happy :)

 - [github.com/peter-mcconnell](https://github.com/peter-mcconnell)

 - [twitter.com/PeteMcConnell_](https://www.twitter.com/PeteMcConnell_)

 - [linkedin.com/in/pemcconnell](https://www.linkedin.com/in/pemcconnell)

 - [firebolt.io/careers](https://firebolt.io/careers) :)
