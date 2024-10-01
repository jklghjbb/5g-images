#!/bin/bash

# Define variables
VERSION="ee1d86cd80841f47061bbdbe25786e3702059937"  # Replace with the desired version of srsRAN
IMAGE_NAME="srsran_builder"
export BUILDKIT_PROGRESS=plain

# Build the Docker image
echo "Building the Docker image with srsRAN version $VERSION..."
docker build --build-arg version=$VERSION --build-arg num_procs=15 -t $IMAGE_NAME .

# Check if the build succeeded
if [ $? -ne 0 ]; then
    echo "Docker build failed. Exiting."
    exit 1
fi

# Run the container (optionally in interactive mode to test)
echo "Running the Docker container..."
# docker run --rm -it $IMAGE_NAME bash

# Optionally, you can add additional commands to run specific tests inside the container
# For example, you could add:
# docker run --rm $IMAGE_NAME /opt/srsRAN_Project/target/bin/srsenb --help
