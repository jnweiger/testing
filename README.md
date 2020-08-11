# jnweiger: Testing

This repo has some testing stuff.

## Folding

<details open>
<summary>Do we have proper markdown?</summary>

* [ ] in github
* [ ] with all features?
* [ ] and can it do folding?
</details>

Yeah, and if you want to see

<details close>
<summary>more, then click the little triangle at the left hand side...</summary>

+ you made it,
+ congratulations
</details>

<details open>
<summary>The effect of showspeed is similar to inserting |pv| into a command pipeline. Showspeed has these advantage over pv:</summay>
  
 + No need to construct an artificial pipeline if monitoring a simple command.
 + You can call it *after* starting your command or pipeline.
 + You can start stop monitoring as you like.
 + It can forsee the end and print an estimated time of arrival. Sometimes. 
</details>

## Today's special: trigger stuff at cloud.drone.io

[![Build Status](https://cloud.drone.io/api/badges/jnweiger/testing/status.svg)](https://cloud.drone.io/jnweiger/testing)

Put this in your .drone.yml as a starting point:
```
---
kind: pipeline
type: docker
name: arm64
platform:
  os: linux
  arch: arm64
steps:
  - name: test
    image: debian:latest
    commands:
      - echo "Hello World. This is .drone.yml"
      - uname -m
      - cat /etc/hosts
      - env

```

## License

Distribute under GPLv2 or ask.

## Copyright

```
Copyright (c) 2019 Jürgen Weigert <jnweiger@gmail.com>
```
