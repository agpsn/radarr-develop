#!/bin/bash
clear; set -eu

echo $(cat ~/.ghcr-token) | docker login ghcr.io -u $(cat ~/.ghcr-user) --password-stdin &>/dev/null

	GBRANCH=$(git branch | grep "*" | rev | cut -f1 -d" " | rev)
	RVERSION=$(curl -sL "https://radarr.servarr.com/v1/update/master/changes?runtime=netcore&os=linuxmusl" | jq -r '.[0].version')
	DVERSION=$(curl -sL "https://radarr.servarr.com/v1/update/develop/changes?runtime=netcore&os=linuxmusl" | jq -r '.[0].version')

#BUILD/PUSH v3
	echo "Building and Pushing 'ghcr.io/agpsn/docker-radarr:$RVERSION'"
	docker build --quiet --force-rm --rm --tag ghcr.io/agpsn/docker-radarr:latest --tag ghcr.io/agpsn/docker-radarr:$RVERSION -f ./Dockerfile.v4 .
	docker push --quiet ghcr.io/agpsn/docker-radarr:latest; docker push --quiet ghcr.io/agpsn/docker-radarr:$RVERSION && docker image rm -f ghcr.io/agpsn/docker-radarr:$RVERSION
	git tag $RVERSION && git push origin $RVERSION --tags
	echo ""

#BUILD/PUSH v4
	echo "Building and Pushing 'ghcr.io/agpsn/docker-radarr:$DVERSION'"
	docker build --quiet --force-rm --rm --tag ghcr.io/agpsn/docker-radarr:develop --tag ghcr.io/agpsn/docker-radarr:$DVERSION  -f ./Dockerfile.v5 .
	docker push --quiet ghcr.io/agpsn/docker-radarr:develop; docker push --quiet ghcr.io/agpsn/docker-radarr:$DVERSION && docker image rm -f ghcr.io/agpsn/docker-radarr:$DVERSION
	echo ""

#SOURCE v4/v5
	git add . && git commit -m "Updated" && git push --quiet
