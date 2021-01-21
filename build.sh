#!/bin/bash

set -ex

REPOSITORY=public.ecr.aws/r3k4u0b7/sentry
VERSION=${VERSION:=latest}
BUILDNUM=${BUILDNUM:=NaN}
TAG="$VERSION-$BUILDNUM"

if [[ -d "$VERSION" ]] ; then
  cd "$VERSION" && docker build --rm -t "$REPOSITORY:$TAG" .
else
  docker build --rm -t "$REPOSITORY:$TAG" .
fi

docker push "$REPOSITORY:$TAG"
