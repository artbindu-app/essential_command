<!-- # Docker Learning -->
## Docker Learning

### What is Docker?

A platform that helps developers build, share & run applications with container.

### What is Docker Images and Containers?

Images:- Are templates of Project
Container:- Running Instance of Image

#### Docker Images

- It's kind of ready-to-use software read-only template
- Images is made with source codes, libraries, external dependencies and tools.
- Images can not be updated.
- If you want to make change in image you have to create new image
- Images can not run directly.</br>
  
- **Example of Images**:</br>
  - Node.js Setup
  - React setup
  - Code of application
  - Dependencies
  - Other supporting tools
  - docker file
So, Docker Image is a template of our project.</br>

#### Docker Containers

- Container is a process that runs applicatin with images
- Container is an isolated process
- Means Container run independently on computer

#### Docker Images Type

Docker Image | description
------- | --------
Parent Image  |   Not Depend on other Image like: [Node.js](https://hub.docker.com/_/node), [PHP](https://hub.docker.com/_/php), [Python](https://hub.docker.com/_/python)
Base Image    |   Depend on Base Image. Example: React App required base image of 'Node.js'

### Basic Command of Docker

Command | description
------- | --------
help                | `docker -help`
version             | `docker --version`
[Pull Docker Images](https://hub.docker.com)  | `docker pull <docker_image_version>` <br> <br> Node.js ≡ `docker pull node:lts-slim` <br> Python ≡ `docker pull python`
Run Docker Image |`doker run -it <docker_image_name>` <br>or<br> `docker run -it <docker_image_name> /bin/bash` <br><br> Node.js ≡ `docker run -it node:lts-slim /bin/bash` <br> Python ≡ `docker run -it python /bin/bash`
Create Docker file| `touch dockerfile` <br> need to install `touch-cli` globally
Show all Docker Images      | `docker images`
Show all Docker Containers Info | `docker ps -a`
Show Running Docker Containers Info  | `docker ps`
Create Docker Images | `docker build -t <docker_image_name_in_lowercase> .` <br> Run this with in your application directory where you crate the docker file
Run Docker Images / Create Docker Container | `docker run --name <docker_container_name> -p <host_port>:<default_app_port> <docker_image_name>`
Start Docker Container      | `docker container start <docker_image_name>`
Stop Docker Container       | `docker container stop <docker_image_name>`
Delete Docker Containers             |  `docker container rm <docker_container_name>`
Delete Docker Containers (Forcefully)|  `docker container rm <docker_container_name> -f`
Delete Docker Images (Forcefully)   | `docker image rm <docker_image_name> -f`
Delete all Docker Images/Container  | `docker system prune -a`
Create Docker image (with version)  | `docker build -t <docker_image_name>:<app_version> .`
Run Docker Images   (with version)  | `docker run --name <docker_container_name> -p <host_port>:<default_app_port> <docker_image_name>:<docker_image_version>`
-|-
View Other Docker Images Command    | `docker image COMMAND`
View Other Docker Container Command | `docker container COMMAND`

### Docker File Sample

```sell
  # Pull Docker Image/s
  FROM <Docker Image Name>
  # Mention Project Destination if required
  WORKDIR <Destination directory name>
  # Copy image from source to destination
  COPY <Source> <Destination>
  # Install Packages
  RUN <Packages Install Script>
  # Mention App Port 
  EXPOSE <Port No>
  # Run project - Mention app run Script
  CMD [<comma separator command with double quotes>]
```

#### What is Docker Compose File?

Command | description
------- | --------
Build Docker Image          | `docker-compose build`
Start Docker Container      | `docker compose up -d`
Stop Docker Container       | `docker-compose down` 
Restart Docker Container    | `docker-compose down && docker-compose up -d`
Create Docker Image & Start Container    | `docker-compose build && docker-compose up -d`
Rebuild Docker Image & restart Container | `docker-compose down && docker-compose build && docker-compose up -d`

### Docker Compose Sample File

```shell
  # Docker Services
  Services:
    # Docker Image Config
    img:
      build: <docker_image_destination>
      container_name: <docker_image_name>
      ports:
        - <host_port>:<default_app_port>
```
