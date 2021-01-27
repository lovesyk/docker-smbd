# docker-smbd
## Description
This is a simple docker image for smbd of the Samba suite based on Debian testing. It has no hard-coded version numbers and will always be up-to-date.

Up to 100 users can be specified using environment variables named like USER1, USER2 etc. with the value of "name:id:groupId:password".

## Example docker-compose.yml
```
version: "2.4"

services:
  smbd:
    build: ../../images/smbd
    container_name: smbd
    environment:
      USER1: "user1:1000:1000:password1"
      USER2: "user2:1001:1001:password2"
    network_mode: host
    volumes:
      - ./smb.conf:/etc/samba/smb.conf
      - type: bind
        source: /mnt/storage
        target: /mnt/storage
```
