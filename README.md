[![kaindlglobalnetwork.de](https://raw.githubusercontent.com/kgncloud/docker-template/main/KAINDL_LogoDesign_B_orange_rgb.png)](https://kaindlglobalnetwork.de)

# glusterfs-swarm


The [Kaindl Network](https://kaindlglobalnetwork.de) team brings you another container release featuring:

* regular and timely application updates
* consitent way to monitor health of the container
* bringing a container as close as possible to linuxserver.io releases


## Version Tags

This image provides various versions that are available via tags. `main` tag usually provides the latest stable version. Others are considered under development and caution must be exercised when using them.

| Tag | Description |
| :----: | --- |
| main | Latest Release Version of this Container |

## Environment Variables
| Name               | Description                                | Default         | Example                                     |
|:------------------ |:------------------------------------------ |:--------------- |:------------------------------------------- |
| SERVICE_NAME       | DNS name to query = discover peers         | gluster         | glusterfs-storage.default.svc.cluster.local |
| GLUSTER_VOL        | name of the gluster volume to expose       | vol0            | myvol0                                      |
| GLUSTER_BRICK_PATH | Path of the local brick (mount)            | /gluster_volume | /bricks/brick0                              |
| DEBUG=1            | Verbose mode                               | 0               |                                             |
| PUID               | User/Group                                 | 1000            |                                             |
| PGID               | User/Group                                 | 1000            |                                             |
| TZ                 | Timezone                                   | Europe/Berlin   |                                             |

## Healthcheck

This image has already a healtcheck included :D

docker pull ghcr.io/kgncloud/mautrix-whatsapp:main
