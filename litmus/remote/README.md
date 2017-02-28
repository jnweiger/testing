# ownCloud: Litmus

This guide gives you some instructions how to run the Litmus test suite against an existing remote ownCloud installation. Just follow the steps below to see if your instance behaves correctly.

## Usage

As we wrapped the test suite in a container it's quite simple to launch the test suite, you just need to start a single container with the following command:

```
docker run -ti --rm \
  --name litmus \
  --env LITMUS_URL=https://owncloud-demo.com/remote.php/webdav \
  --env LITMUS_USERNAME=admin \
  --env LITMUS_PASSWORD=admin \
  owncloud/litmus:latest
```

If you want to see all available environment variables you can use with this docker image please take a look at the corresponding [README](https://github.com/owncloud-docker/litmus#available-environment-variables).
