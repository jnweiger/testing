#!/usr/bin/env bash

declare -x TESTING_NAME
declare -x TESTING_CACHE
declare -x TESTING_DATABASE
declare -x TESTING_SUITE
declare -x TESTING_TESTS
declare -x TESTING_IMAGE
declare -x TESTING_PATH
declare -x TESTING_CLIENT

[[ -z "${TESTING_NAME}" ]] && TESTING_NAME="testing"
[[ -z "${TESTING_CACHE}" ]] && TESTING_CACHE="none"
[[ -z "${TESTING_DATABASE}" ]] && TESTING_DATABASE="mysql"
[[ -z "${TESTING_SUITE}" ]] && TESTING_SUITE="litmus"
[[ -z "${TESTING_TESTS}" ]] && TESTING_TESTS="basicSync"
[[ -z "${TESTING_IMAGE}" ]] && TESTING_IMAGE="owncloud/base:latest"
[[ -z "${TESTING_PATH}" ]] && TESTING_PATH="source"
[[ -z "${TESTING_CLIENT}" ]] && TESTING_CLIENT="latest"

case ${TESTING_CACHE} in
  memcached)
    cat snippets/memcached.yml >> generated.yml
    ;;
  redis)
    cat snippets/redis.yml >> generated.yml
    ;;
  *)
    cat snippets/base.yml >| generated.yml
    ;;
esac

case ${TESTING_DATABASE} in
  mysql)
    cat snippets/mysql.yml >> generated.yml
    ;;
  pgsql)
    cat snippets/pgsql.yml >> generated.yml
    ;;
esac

case ${TESTING_SUITE} in
  litmus)
    cat snippets/litmus.yml >> generated.yml
    ;;
  smashbox)
    cat snippets/smashbox.yml >> generated.yml
    ;;
esac

COMPOSE="docker-compose -f generated.yml --project-name ${TESTING_NAME}"

trap "${COMPOSE} down" EXIT

${COMPOSE} pull --ignore-pull-failures
${COMPOSE} up -d

case ${TESTING_SUITE} in
  litmus)
    rm -f litmus.out fail.txt

    ${COMPOSE} exec litmus /usr/local/bin/litmus-wrapper | tee litmus.out
    grep -a -v 'high.unicode' litmus.out | grep -a FAIL | tee fail.txt

    if [ -s fail.txt ]
    then
      echo "Litmus test suite failed!"
      exit 1
    else
      echo "Litmus test suite succeeded!"
      exit 0
    fi
    ;;
  smashbox)
    ${COMPOSE} exec smashbox /usr/local/bin/smash-wrapper

    if [ $? -gt 0 ]
    then
      echo "Smashbox test suite failed!"
      exit 1
    else
      echo "Smashbox test suite succeeded!"
      exit 0
    fi
    ;;
  *)
    echo "Unknown test name!"
    exit 110
    ;;
esac
