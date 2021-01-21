#!/bin/bash

set -ex

REPOSITORY=361527076523.dkr.ecr.us-west-2.amazonaws.com/sentry
VERSION=${VERSION:=latest}
BUILDNUM=${BUILDNUM:=NaN}
TAG="$VERSION-$BUILDNUM"

if [[ -d "$VERSION" ]] ; then
  cd "$VERSION" && docker build --rm -t "$REPOSITORY:$TAG" .
else
  docker build --rm -t "$REPOSITORY:$TAG" .
fi

docker push "$REPOSITORY:$TAG"
