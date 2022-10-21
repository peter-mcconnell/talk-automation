automation talk
===============

Artefacts that accompany a talk for https://www.nidevconf.com/


Slides
------

![example of patat slides](media/talk.png "example of patat slides")

```sh
patat talk.md
```

Run
---

```sh
docker-compose up -d
```

view at: http://localhost:4440/

![rundeck_jobs](media/rundeck_jobs.png "rundeck jobs")

![rundeck_output](media/rundeck_output.png "rundeck output")

Requirements
------------

```sh
# tested against the following docker & docker-compose versions on ubuntu:20.04
$ docker-compose version
docker-compose version 1.29.2, build 5becea4c

$ docker version
Client: Docker Engine - Community
 Version:           20.10.18

Server: Docker Engine - Community
 Engine:
  Version:          20.10.18
```
