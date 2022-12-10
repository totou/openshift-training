# Docker exercise

Locally build using Docker deskptop a custom image of a publicly available one.

For consistency with the rest of the exercises, I recommend that you make changes onto "nginx:1.19.6" or newer version

## Commands to play

```
docker build -t my-nginx-image .
```

Check that you file is in it
```
docker run --rm -ti --entrypoint bash my-nginx-image
```

Look also in the Docker desktop GUI for layers

