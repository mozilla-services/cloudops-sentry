#!/bin/bash

set -ex

REPOSITORY=hub.prod.mozaws.net/sentry
VERSION=${VERSION:=latest}
BUILDNUM=${BUILDNUM:=NaN}
TAG="$VERSION-$BUILDNUM"

if [[ -d "$VERSION" ]] ; then
  cd "$VERSION" && docker build --rm -t "$REPOSITORY:$TAG" .
else
  docker build --rm -t "$REPOSITORY:$TAG" .
fi

docker push "$REPOSITORY:$TAG"
