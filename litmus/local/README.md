# ownCloud: Litmus

This guide gives you some instructions how to run the Litmus test suite against a local ownCloud instance launched via Docker. Just follow the steps below to see if the specific ownCloud version behaves correctly. Currently we got two options to launch the test suite.


## Running on local source

To run the test suite for a specific clone of the ownCloud source just execute the following steps. The `wget` command is just an example to fetch the source, you can also use the source of a pull request.


### Usage

```
wget -O - https://download.owncloud.org/community/owncloud-9.1.4.tar.bz2 | tar xjf -

export TESTING_PATH=./owncloud
export TESTING_LITMUS=latest
export TESTING_CACHE=\OC\Memcache\APCu

docker-compose -f from-source.yml pull
docker-compose -f from-source.yml up -d
docker-compose -f from-source.yml exec litmus /usr/local/bin/litmus-wrapper
docker-compose -f from-source.yml down
```

Just to explain what we want to archive with the commands you can see above we have prepared this small listing with some explanation:

* `pull`: Always make sure to use the latest container version
* `up`: Launch the docker-compose setup in the background
* `exec`: Launch the test suite itself, the exit code is important for automation
* `down`: Destroy the test environment to leave a clean space


### Available environment variables

| Variable | Description |
| --- | --- |
| TESTING_PATH | Path to the ownCloud source, e.g. `./owncloud` |
| TESTING_PORT | Port for the host binding, e.g. `8080` |
| TESTING_LITMUS | Version of the Litmus container, e.g. `latest` |
| TESTING_CACHE | Used local cache, e.g. `\OC\Memcache\APCu` |


## Running on Docker container

To run the test suite for a specific already existing Docker ownCloud container just execute the following steps.


### Usage

```
export TESTING_OWNCLOUD=owncloud/server:9.1.4
export TESTING_PATH=./owncloud
export TESTING_LITMUS=latest
export TESTING_CACHE=\OC\Memcache\APCu

docker-compose -f from-container.yml pull
docker-compose -f from-container.yml up -d
docker-compose -f from-container.yml exec litmus /usr/local/bin/litmus-wrapper
docker-compose -f from-container.yml down
```

Just to explain what we want to archive with the commands you can see above we have prepared this small listing with some explanation:

* `pull`: Always make sure to use the latest container version
* `up`: Launch the docker-compose setup in the background
* `exec`: Launch the test suite itself, the exit code is important for automation
* `down`: Destroy the test environment to leave a clean space


### Available environment variables

| Variable | Description |
| --- | --- |
| TESTING_OWNCLOUD | An ownCloud image to use, e.g. `owncloud/server:9.1.4` |
| TESTING_LITMUS | Version of the Litmus container, e.g. `latest` |
| TESTING_CACHE | Used local cache, e.g. `\OC\Memcache\APCu` |
