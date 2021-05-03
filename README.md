# 2021 Introduction to containers demo

## The flow of containers
The basic flow of containers is: make changes to your code -> Build the code -> Push the code -> Test the changes

## Common commands

### Building and tag the application
podman build . -t quay.io/{username}/my-cool-image:latest

### Push the image
podman push quay.io/{username}/my-cool-image:latest

### Run the image and expose the ports
podman run -it -p 3000:3000 quay.io/{username}/my-cool-image:latest
