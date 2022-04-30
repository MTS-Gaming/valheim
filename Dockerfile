FROM ghcr.io/mts-gaming/docker-steamcmd-base

RUN +login anonymous \
    +app_update 896660 validate \
    +quit
