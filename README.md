# jnweiger: Testing

This repo has some testing stuff.

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
