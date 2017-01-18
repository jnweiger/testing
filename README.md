# ownCloud: Testing

[![](https://images.microbadger.com/badges/image/owncloud/testing.svg)](https://microbadger.com/images/owncloud/testing "Get your own image badge on microbadger.com")

This is our minimal image for testing wrapper based on our [Ubuntu container](https://registry.hub.docker.com/u/owncloud/ubuntu/).


## Usage

```bash
docker run -ti --rm \
  --name testing \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume $(pwd)/source:/source \
  owncloud/testing:latest
```


## Build locally

The available versions should be already pushed to the Docker Hub, but in case you want to try a change locally you can always execute the following command to get this image built locally:

```
IMAGE_NAME=owncloud/testing ./hooks/build
```


## Versions

* [latest](https://github.com/owncloud-docker/testing/tree/master) available as ```owncloud/testing:latest``` at [Docker Hub](https://registry.hub.docker.com/u/owncloud/testing/)


## Volumes

* `/source`


## Ports

* None


## Available environment variables

```
TESTING_NAME testing
TESTING_NUMBER 0
TESTING_CACHE none
TESTING_DATABASE mysql
TESTING_SUITE litmus
TESTING_TESTS basicSync
TESTING_IMAGE webhippie/owncloud:latest
```


## Issues, Feedback and Ideas

Open an [Issue](https://github.com/owncloud-docker/smashbox/issues)


## Contributing

Fork -> Patch -> Push -> Pull Request


## Authors

* [Thomas Boerger](https://github.com/tboerger)
* [Thomas Mueller](https://github.com/DeepDiver1975)


## License

MIT


## Copyright

```
Copyright (c) 2017 Thomas Boerger <tboerger@owncloud.com>
```
