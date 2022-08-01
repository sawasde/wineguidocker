# Dockerfile to run the X-VNC-Server
# Debian linux image

FROM debian:stretch
MAINTAINER @alturiano <https://alturiano.com>

# Environment variables
ENV USER xuser
ENV GROUP xusers
ENV HOME /home/$USER
ENV ID 101

# Create new X-Server group
RUN groupadd -g $ID -r $GROUP

# Create new X-Server user
RUN useradd -u $ID -g $GROUP -d $HOME -s /bin/bash -m $USER

# Update system
RUN apt-get update

# Install tightvnc as VNC-Server, a default X11-Server xrdb is installed
RUN apt-get install -y tightvncserver

# Magic Cookie shared file
RUN mkdir /mcookie && chown -R $USER:$GROUP /mcookie

# Default VNC-Server configuration
ENV DISPLAY :0
ENV DEPTH 24
ENV GEOMETRY 800x600

# The entrypoint script
COPY run.sh $HOME/run.sh
RUN chmod +x $HOME/run.sh

# Deploy
USER $USER
WORKDIR $HOME
ENTRYPOINT ["./run.sh"]