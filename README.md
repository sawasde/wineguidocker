
# Wine GUI on Docker

[![Na|solid](https://img.shields.io/badge/license-GPL-brightgreen)](https://github.com/alturiano/wineguidocker/blob/main/LICENSE) ![Na|solid](https://img.shields.io/github/repo-size/alturiano/wineguidocker) 

Access docker containers via GUI (Graphical User Interface). Now you can view a desktop application running on any container. Graphical access to wine desktop application on docker containers.

<img width="675" alt="2022-08-08 12_37_23-Ubuntu 64-bit - VMware Workstation 16 Player (Non-commercial use only)" src="https://user-images.githubusercontent.com/22453747/184756240-cf07a167-c36a-4c6c-97cf-6ca828586445.png">

# Requirements

 - Linux machine. **Preferably** debian-based (Does not work on windows machines `as network_mode: host` is needed)
 - Docker engine. Install it [here](https://docs.docker.com/engine/install/)
 - Docker compose. Install it [here](https://docs.docker.com/compose/install/)
 - On host machine install a **vnc viewer**. it could be tighvncviewer `sudo apt install xtightvncviewer`

# Usage

This project is using wine **notepad++.exe** as a default GUI desktop application. Almost any windows wine executable is supported, **app** container run the application located in **app/bin**. On `docker-compose.yml` the **EXECUTABLE** environment variable could be potentially changed to run other wine applications. Don't forget to put the new application on **app/bin**.

1. On repository root, build and run the docker containers:

       docker-compose up --build

This will launch the **server** container on port **59xx** as well as the desktop app. Wait until all services are ready.

2. Then access the application via **vncviewer**. by default the server is running on port 5983, you can change the port on `docker-compose.yml` **DISPLAY** environment variable to run the service on different port. Access the application using:

       vncviewer 127.0.0.1::5983

It will ask for password, type the same password as `docker-compose.yml` **VNCPASSWD** environment variable.

**Note**: the **server** container must be rebuilt if it's shut down (perhaps an issue, any help would be appreciated).

# Infrastructure explained

 - **Server** container is detailed on **server/Dockerfile**. basically it is a tighvncserver running on port **59xx**.
 - **Shared volume** would contain the folder **/mcookie** across all containers to share xauth session cookies to get access to server.
 - **Client** container is detailed on **client/Dockerfile**. It's a template image to build on top any app docker image.
 - **App** container is detailed on **app/Dockerfile**. It's based on **client** container image. It runs the main desktop application.
 - All containers are running on network_mode **host** thus the're sharing the network. This is not possible on Windows host machines.
