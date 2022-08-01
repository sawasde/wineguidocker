# Dockerfile to run MetaTrader with wine
# xclient debian image

FROM debian:xclient
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

# Install xdotool to work with tightvnc
#RUN apt install -y  build-essential
#RUN git clone https://github.com/jordansissel/xdotool.git
#RUN cd xdotool \
# && git checkout edbbb7a8f664ceacbb2cffbe8ee4f5a26b5addc8 \
# && make install

# Wine environment (no mono and gecko)
ENV WINEDLLOVERRIDES="mscoree,mshtml="

# Copy MetaTrader Folder
COPY mt5 $HOME

# The entrypoint script
COPY run.sh $HOME/run.sh
RUN chmod +x $HOME/run.sh

# Deploy
USER $USER
WORKDIR $HOME
ENTRYPOINT ["./run.sh"]