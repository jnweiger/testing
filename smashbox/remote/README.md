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

If you want to see all available environment variables you can use with this docker image please take a look at the corresponding [README](https://github.com/owncloud-docker/smashbox#available-environment-variables).
