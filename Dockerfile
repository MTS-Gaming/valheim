FROM ghcr.io/mts-gaming/docker-steamcmd-base

# Labels
LABEL org.opencontainers.image.authors="andrew_stclair@hotmail.com"
LABEL description="Valheim Dedicated Server"
LABEL version="v1.0.0"

ENV VALHEIM_NAME="valheim" \
    VALHEIM_PORT="2456" \
    VALHEIM_WORLD="valheim" \
    VALHEIM_PASSWORD="beergood" \
    VALHEIM_PUBLIC="1" \
    LD_LIBRARY_PATH="./linux64" \
    SteamAppId="892970"

RUN ["/steamcmd/steamcmd.sh", \
    "+force_install_dir", "/valheim", \
    "+login", "anonymous", \
    "+app_info_update", "1", \
    "+app_update", "896660", "validate", \
    "+quit"]

WORKDIR /valheim

CMD ./valheim_server.x86_64 \
    -nographhics \
    -batchhmode \
    -name ${VALHEIM_NAME} \
    -port ${VALHEIM_PORT} \
    -world ${VALHEIM_WORLD} \
    -password ${VALHEIM_PASSWORD} \
    -public ${VALHEIM_PUBLIC} \
    -crossplay

EXPOSE 2456/udp
EXPOSE 2457/tcp

VOLUME [ "/root/.config/unity3d/IronGate/Valheim" ]
