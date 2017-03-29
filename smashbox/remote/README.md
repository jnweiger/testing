# ownCloud: Smashbox

This guide gives you some instructions how to run the Smashbox test suite against an existing remote ownCloud installation. Just follow the steps below to see if your instance behaves correctly.

## Usage

As we wrapped the test suite in a container it's quite simple to launch the test suite, you just need to start a single container with the following command:

```
docker run -ti --rm \
  --name smashbox \
  --env SMASHBOX_URL=owncloud-demo.com \
  --env SMASHBOX_SSL_ENABLED=true \
  --env SMASHBOX_ACCOUNT_PASSWORD=qwertzuiop \
  --env SMASHBOX_USERNAME=admin \
  --env SMASHBOX_PASSWORD=admin \
  --env SMASHBOX_TEST_SET=-a \
  --env SMASHBOX_TEST_NAME=basicSync \
  owncloud/smashbox:latest
```

`SMASHBOX_URL` must be without protocol. If your URL is at https://172.18.16.143/owncloud, specify `owncloud/smashbox:latest`.
`SMASHBOX_USERNAME` and `SMASHBOX_PASSWORD` are credentials of an existing(!) user in the administration group. It is used to e.g. create a smashbox user account, whose password will be set to 
`SMASHBOX_ACCOUNT_PASSWORD` (any random string will do here).

The configuration
`SMASHBOX_TEST_SET=-a` and `SMASHBOX_TEST_NAME=basicSync` is expected to run between 10 and 30 Minutes, depending on network and server perfomance.

If you want to see all available environment variables you can use with this docker image please take a look at the corresponding [README](https://github.com/owncloud-docker/smashbox#available-environment-variables).


## Versions

You can see the available Docker tags within the [responsible repository](https://github.com/owncloud-docker/smashbox#versions) where we are building the images.
