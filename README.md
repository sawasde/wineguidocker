
# Wine GUI on Docker

[![Na|solid](https://img.shields.io/badge/license-GPL-brightgreen)](https://github.com/alturiano/wineguidocker/blob/main/LICENSE) ![Na|solid](https://img.shields.io/github/repo-size/alturiano/wineguidocker) 

Access docker containers via GUI (Graphical User Interface). Now you can view a desktop application running on any container. Access wine desktop application on docker containers.

# Requirements

 - Linux machine **preferably** debian-based (Does not work on windows as shared network on host is needed)
 - Docker daemon. Install it [here](https://docs.docker.com/engine/install/)
 - Docker compose. Install it [here](https://docs.docker.com/compose/install/)
 - On host machine install a **vnc viewer**. it could be tighvncviewer `sudo apt install xtightvncviewer

# Usage

This project is using wine **notepad++.exe** as a default GUI desktop application. Almost any windows wine executable is supported, **app** container run the application located in **app/bin**. On `docker-compose.yml` the **EXECUTABLE** environment variables could be potentially changed to run other wine applications. Don't forget to put the new application on **app/bin**.


1. On repository root, build and run the docker containers:

       docker-compose up --build

This will launch the **server** container as well as the desktop app. Wait until all services are ready.

2. Then access the application via **vncviewer**. by default the server is running on port 5983, you can change the port on `docker-compose.yml` **DISPLAY** environment variable to run the service on port **59xx**

       vncviewer 127.0.0.1::5983

It will ask for password, type the same password as `docker-compose.yml` **VNCPASSWD** environment variable.

**Note**: the **server** container must be rebuilt if it's shut down.

# Infrastructure explained

