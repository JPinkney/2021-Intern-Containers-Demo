# Specify the base image you want to use. In this case it's fedora linux
FROM fedora:34

# Install golang
RUN dnf install -y golang

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
  CGO_ENABLED=0 GOOS=linux GOARCH=${ARCH} GO111MODULE=on go build -o server main.go

# Run the compiled application
ENTRYPOINT ["./server"]
