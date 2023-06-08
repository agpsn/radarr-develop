#!/bin/bash
set -eu

RVERSION=$(curl -sL "https://radarr.servarr.com/v1/update/develop/changes?runtime=netcore&os=linuxmusl" | jq -r '.[0].version')

echo $(cat ../.token) | docker login ghcr.io -u $(cat ../.user) --password-stdin &>/dev/null

echo "Updating Radarr: v$RVERSION"
docker build --quiet --force-rm --rm --tag ghcr.io/agpsn/docker-radarr:develop --tag ghcr.io/agpsn/docker-radarr:$RVERSION -f ./Dockerfile.develop .
git tag -f $RVERSION && git push --quiet origin $RVERSION -f --tags
git add . && git commit -m "Updated" && git push --quiet
docker push --quiet ghcr.io/agpsn/docker-radarr:develop; docker push --quiet ghcr.io/agpsn/docker-radarr:$RVERSION && docker image rm -f ghcr.io/agpsn/docker-radarr:$RVERSION
echo ""
