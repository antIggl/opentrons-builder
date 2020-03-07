# Source code builder Docker image for Opentrons

It builds a docker container image with all the required libraries to build any part of the Opentrons software.

## Build the image
```
docker build -t opentrons-builder -f Dockerfile .
```

## Pull the docker image from Dockerhub

```
docker pull antiggl/opentrons-builder
```

## Use the image

Edit appropriately the ```start_ot2builder.sh``` script and launch it.
By default, both image and script do not run any command. They start on Bash shell command line.

```
chmod +x ./start_ot2builder.sh
./start_ot2builder.sh
```
OR
```
# Allowing access to gui for local.docker group users
xhost + local:docker

# Running the docker container, exposing the local DISPLAY to the applications running inside it.

docker run -it -d --rm --name=ot2_builder \
        -v /path/to/src/opentrons:/home/opentrons/src \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY=unix$DISPLAY \
        --workdir /home/opentrons/src --entrypoint /bin/bash \
        --network ot2_net \
        -p8090:8090 \
        -p8080:8080 \
        opentrons-builder
```
One can launch an additional shell running the following command.

```
docker exec -it ot2-builder /bin/bash
```

## Useful Notes

- Start with a clean repo, at least clean from previous runs of local tools.
- Use bind volume to your source code, so you don't need to reboot container.

## Contributors
- Antonios Inglezakis (@antIggl)
