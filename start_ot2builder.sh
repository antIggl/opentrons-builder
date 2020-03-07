#!/bin/bash

# Allowing access to gui for local.docker group users
xhost + local:docker

# Running the docker container, exposing the local DISPLAY to the applications running inside it.


docker run -it -d --rm --name=ot2_builder \
	-v /home/ainglezakis/teeeests/opentrons-tests/GITHUB_repos/opentrons:/home/opentrons/src \
	-v /home/ainglezakis/teeeests/opentrons-tests/sample_protocols:/home/opentrons/sample_protocols \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
	--workdir /home/opentrons/src --entrypoint /bin/bash \
	--network ot2_net \
	-p8090:8090 \
	-p8080:8080 \
	opentrons-builder
