![ ](https://img.shields.io/github/v/tag/agpsn/docker-radarr?color=00CCFF&label=:latest&style=plastic&logo=%20) 
![ ](https://img.shields.io/github/v/tag/radarr/radarr?color=00CCFF&label=:develop&style=plastic&logo=%20) 


```
docker run -d \
  --name=radarr \
  -e PUID=99 \
  -e PGID=100 \
  -e TZ=UTC \ #optional
  -e UMASK=022 \  #optional
  -p <hostport>:7878 \
  -v <hostconfigpath>:/config \
  -v <hostmediapath>:/data \ #optional
  --restart unless-stopped \  #optional
  ghcr.io/agpsn/docker-radarr:latest
```

```
docker run -d \
  --name=radarr \
  -e PUID=99 \
  -e PGID=100 \
  -e TZ=UTC \ #optional
  -e UMASK=022 \  #optional
  -p <hostport>:7878 \
  -v <hostconfigpath>:/config \
  -v <hostmediapath>:/data \ #optional
  --restart unless-stopped \  #optional
  ghcr.io/agpsn/docker-radarr:develop
```
