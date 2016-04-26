# gradler-docker

Dockerfiles for the [`jaysong/gradle`](https://hub.docker.com/r/jaysong/gradle/) Docker
Hub images which contains Postgres with PostGIS extensions.

## Feature:

- Java 8
- Gradle 2.13
- `GRADLE_USER_HOME` is set at `/cache/.gradle`.
- `GRADLE_HOME` is set at `/usr/bin/gradle`.
- A mount point is created at `/app` with the working directory set to it.

## How-To:
```
docker run --rm -v `pwd`:/app jaysong/gradle:8-2.13 build
```
