# Simple Flask App

* Uses Alpine Linux because smaller container

Inspired by [containertutorials.com](http://containertutorials.com/docker-compose/flask-simple-app.html)

## Build the Docker Image

```
docker build -t flask-docker .
```

## Run the Docker Container

```
docker run -d -p 5000:5000 flask-docker
```

## Gotcha on Mac

On OS X, you will likely get a **Connection refused** error because port 5000 is
*exposed on the virtual machine*, and not on the host. See the
[Docker docs](https://docs.docker.com/engine/installation/mac/#access-container-ports)
for more details.

Assuming you named your Docker host `foo`, here are two workarounds:

### Use Virtual Machine's IP

```
curl `docker-machine ip foo`:5000
```

### Forward the Virtual Machine's Port

```
VBoxManage controlvm "foo" natpf1 "tcp-port5000,tcp,,5000,,5000";
```

See [this SO post](http://stackoverflow.com/a/32175164/234233) for details.
