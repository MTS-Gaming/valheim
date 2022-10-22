# Valheim Dedicated Server
The Valheim dedicated server in a container

## Usage

```bash
docker run -d \
    -e VALHEIM_NAME="Valheim Online" \
    -e VALHEIM_PORT="2456" \
    -e VALHEIM_PASSWORD="ThorOdinson" \
    -e VALHEIM_WORLD="valheim" \
    -e VALHEIM_PUBLIC="1" \
    -p 2456:2456/udp
    -p 2456:2456/tcp
    -p 2457:2457/tcp
    -v valheim:/root/.config/unity3d/IronGate/Valheim
    ghcr.io/mts-gaming/valheim:latest
```

## Environment Variables

| Environment Variable | Description          |
|----------------------|----------------------|
| `VALHEIM_NAME`       | Server name          |
| `VALHEIM_PORT`       | Server port          |
| `VALHEIM_PASSWORD`   | Server Password      |
| `VALHEIM_WORLD`      | World name           |
| `VALHEIM_PUBLIC`     | Is the server public |

## Volumes

| Path                                     | Description                                                                         | Volume Definition |
|------------------------------------------|-------------------------------------------------------------------------------------|-------------------|
| `/root/.config/unity3d/IronGate/Valheim` | Where games usually store their saves.                                              | Yes               |
