# Specify the base image you want to use. In this case it's alpine linux
FROM golang:alpine

# Set the working directory inside of the image
WORKDIR /interns-2020

# Copy and download all dependencies using go mod
COPY backend/go.mod .
COPY backend/go.sum .
RUN go mod download

# Grab all the code and put it into the image
COPY . .

WORKDIR /interns-2020/backend

# Build the application
RUN export ARCH="amd64" && \
  CGO_ENABLED=0 GOOS=linux GOARCH=${ARCH} GO111MODULE=on go build main.go

# Run the compiled application
ENTRYPOINT ["./main"]
