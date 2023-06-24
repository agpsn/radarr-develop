![ ](https://ghcr-badge.egpl.dev/agpsn/docker-radarr/size?tag=develop&color=black&label=SIZE&ignore=latest)
![ ](https://ghcr-badge.egpl.dev/agpsn/docker-radarr/latest_tag?color=black&label=VERSION&ignore=latest)

```
docker run -d \
  --name=radarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=UTC \
  -e UMASK=022 \
  -p <hostport>:7878 \
  -v <hostconfigpath>:/config \
  -v <hostmediapath>:/data \
  --restart unless-stopped \
  ghcr.io/agpsn/docker-radarr:develop
```
