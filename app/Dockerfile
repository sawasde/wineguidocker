# Dockerfile to run MetaTrader with wine
# client debian image

FROM debian:client
MAINTAINER @alturiano <https://alturiano.com>

# Environment variables
ENV USER xclient
ENV HOME /home/$USER

# Add Architecture i386
RUN dpkg --add-architecture i386 && apt-get update

# Install wine
RUN apt install -y --install-recommends --assume-yes wine

# Install tools
RUN apt install -y libx11-dev libxinerama-dev libxtst-dev openssl git

# Wine environment (no mono and gecko)
ENV WINEDLLOVERRIDES="mscoree,mshtml="

# The entrypoint script
COPY run.sh $HOME/run.sh
RUN chmod +x $HOME/run.sh

# Copy Binary file
COPY bin $HOME/bin

# Deploy
USER $USER
WORKDIR $HOME
ENTRYPOINT ["./run.sh"]
