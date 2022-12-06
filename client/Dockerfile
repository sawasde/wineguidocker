# Dockerfile to run a x-client application in the x-server
# Debian linux image

FROM debian:11.5
MAINTAINER @alturiano <https://alturiano.com>

# Environment variables
ENV USER xclient
ENV GROUP xusers
ENV HOME /home/$USER
ENV ID 101

# Create new X-Server group
RUN groupadd -g $ID -r $GROUP

# Create new X-Server user
RUN useradd -u $ID -g $GROUP -d $HOME -s /bin/bash -m $USER

# Update system
RUN apt-get update

# Install xauth to manage magic cookies
RUN apt-get install -y xauth

# Default X-Server configuration
ENV DISPLAY :0
