# gradler-docker

Dockerfiles for the [`jaysong/gradle`](https://hub.docker.com/r/jaysong/gradle/) Docker
Hub images which contains Java and Gradle.

## Feature:

- [java:8](https://hub.docker.com/r/library/java/)
- Gradle 2.13
- `GRADLE_USER_HOME` is set at `/cache/.gradle`.
- `GRADLE_HOME` is set at `/usr/bin/gradle`.
- A mount point is created at `/app` with the working directory set to it.

## How-To:
Assuming the [Gradle Java starter project](https://spring.io/guides/gs/gradle/) in the
working directory, one can run the `build` target by
```
docker run --rm -v $(pwd):/app jaysong/gradle:8-2.13 build
```
