#!/bin/bash

# Stop all running containers
docker container stop $(docker container ls -aq)

# Remove all containers
docker container rm $(docker container ls -aq)

# Remove all images
docker image rm $(docker image ls -aq)

# Remove all volumes
docker volume rm $(docker volume ls -q)

# Remove all custom networks (excluding pre-defined networks: bridge, host, and none)
docker network rm $(docker network ls --filter type=custom -q)

# Clean up system resources
docker system prune -af --volumes

# Print success message
echo "All Docker containers, images, volumes, and custom networks have been removed."
