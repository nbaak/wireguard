# Wireguard

Setup Wireguard on your Server.

## Install (Docker)
I use [WG-Easy](https://github.com/wg-easy/wg-easy)'s docker-compose file:

```text
version: "3.8"
volumes:
  etc_wireguard:

services:
  wg-easy:
    environment:
      - WG_HOST=<<serverdomain>>
      - PASSWORD=<<strongpassword>>

    image: ghcr.io/wg-easy/wg-easy
    container_name: wg-easy
    volumes:
      - etc_wireguard:/etc/wireguard
    ports:
      - "51820:51820/udp"
      - "51821:51821/tcp"
    restart: unless-stopped
    cap_add:
      - NET_ADMIN
      - SYS_MODULE
    sysctls:
      - net.ipv4.ip_forward=1
      - net.ipv4.conf.all.src_valid_mark=1

```

## Nginx
Copy the wireguard.conf to the nginx sites-available folder and then link it to the enaled folder, or use the `install.sh` script in the nginx folder.

You need root permissions to copy to the nginx folder!

```bash
cd nginx
sudo ./install.sh
```

## Client

### Linux
[Tutorial Video](https://www.youtube.com/watch?v=npDDELuiqxY)
On Commandline
```bash
nmcli connection import type wireguard file <<configfile>>
```

### Windows
On Windows you prolly need the [Wirdeguard](https://www.wireguard.com/install/) software.

