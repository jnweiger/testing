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

### Available environment variables

| Variable | Description |
| --- | --- |
| SMASHBOX_USERNAME | Existing admin account that is able to create users. |
| SMASHBOX_PASSWORD | Password for SMASHBOX_USERNAME. |
| SMASHBOX_ACCOUNT_PASSWORD | password used e.g. for the test_basicSync user (any random string will do here). |
| SMASHBOX_TEST_SET | Example: `-a` |
| SMASHBOX_TEST_NAME | Example: `basicSync` This example expected to run between 3 and 10 Minutes, depending on network and server perfomance. | 

If you want to see all available environment variables you can use with this docker image please take a look at the corresponding [README](https://github.com/owncloud-docker/smashbox#available-environment-variables).


### Test results

#### FAIL

Test failure is indicated if the output ends like this:
```
...
SUMMARY:smash.:Elapsed time: 33s (0:00:33.107682)
CRITICAL:smash.:Aborting run -- non-zero exit code (1)
```
<b>echo $?</b><br>
 1

#### PASS

The zero exit code is not printed if the test is good. The output ends like this:

```
...
SUMMARY:smash.:Elapsed time 142s (0:02:22.319994)
```
<b>echo $?</b><br>
 0




## Versions

You can see the available Docker tags within the [responsible repository](https://github.com/owncloud-docker/smashbox#versions) where we are building the images.
