FROM ghcr.io/mts-gaming/docker-steamcmd-base

# Labels
LABEL org.opencontainers.image.authors="andrew_stclair@hotmail.com"
LABEL description="Valheim Dedicated Server"
LABEL version="v1.0.0"

ENV VALHEIM_NAME="valheim"
ENV VALHEIM_PORT="2456"
ENV VALHEIM_WORLD="valheim"
ENV VALHEIM_PASSWORD="beergood"
ENV VALHEIM_PUBLIC="1"

RUN ["/home/steam/steamcmd/steamcmd.sh", \
    "+login", "anonymous", \
    "+app_update", "896660", "validate", \
    "+quit"]

ENTRYPOINT [ "valheim_server", "-nographhics", "-batchhmode", "-name", "${VALHEIM_NAME}", "-port", "${VALHEIM_PORT}", "-world", "${VALHEIM_WORLD}", "-password", "${VALHEIM_PASSWORD}", "-public", "${VALHEIM_PUBLIC}" ]
